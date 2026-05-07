-- ============================================================
-- Finance Tracker — Full Supabase SQL Dump
-- ============================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ─────────────────────────────────────────────────────────────
-- TABLE: accounts
-- Each user can have multiple named accounts (Home, Shop, etc.)
-- ─────────────────────────────────────────────────────────────
CREATE TABLE public.accounts (
  id           UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id      UUID          NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  name         TEXT          NOT NULL CHECK (char_length(name) BETWEEN 1 AND 30),
  color_index  INT           NOT NULL DEFAULT 0 CHECK (color_index BETWEEN 0 AND 5),
  created_at   TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

-- Index for fast per-user account lookup
CREATE INDEX idx_accounts_user_id ON public.accounts(user_id);

-- Row Level Security
ALTER TABLE public.accounts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own accounts"
  ON public.accounts FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own accounts"
  ON public.accounts FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own accounts"
  ON public.accounts FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own accounts"
  ON public.accounts FOR DELETE
  USING (auth.uid() = user_id);


-- ─────────────────────────────────────────────────────────────
-- TABLE: transactions
-- Each transaction belongs to an account.
-- type: 'check_in' (income) or 'check_out' (expense)
-- ─────────────────────────────────────────────────────────────
CREATE TABLE public.transactions (
  id           UUID          PRIMARY KEY DEFAULT uuid_generate_v4(),
  account_id   UUID          NOT NULL REFERENCES public.accounts(id) ON DELETE CASCADE,
  user_id      UUID          NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  title        TEXT          NOT NULL CHECK (char_length(title) BETWEEN 1 AND 100),
  amount       NUMERIC(12,2) NOT NULL CHECK (amount > 0),
  type         TEXT          NOT NULL CHECK (type IN ('check_in', 'check_out')),
  note         TEXT          CHECK (char_length(note) <= 500),
  created_at   TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

-- Indexes for common query patterns
CREATE INDEX idx_transactions_account_id ON public.transactions(account_id);
CREATE INDEX idx_transactions_user_id    ON public.transactions(user_id);
CREATE INDEX idx_transactions_created_at ON public.transactions(created_at DESC);

-- Composite index for filtered queries (account + date range)
CREATE INDEX idx_transactions_account_date
  ON public.transactions(account_id, created_at DESC);

-- Row Level Security
ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own transactions"
  ON public.transactions FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own transactions"
  ON public.transactions FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own transactions"
  ON public.transactions FOR DELETE
  USING (auth.uid() = user_id);


-- ─────────────────────────────────────────────────────────────
-- RPC: get_account_summary
-- Returns total_in, total_out, balance for a given account
-- ─────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.get_account_summary(p_account_id UUID)
RETURNS TABLE (
  total_in   NUMERIC,
  total_out  NUMERIC,
  balance    NUMERIC
)
LANGUAGE sql
SECURITY DEFINER
AS $$
  SELECT
    COALESCE(SUM(CASE WHEN type = 'check_in'  THEN amount ELSE 0 END), 0) AS total_in,
    COALESCE(SUM(CASE WHEN type = 'check_out' THEN amount ELSE 0 END), 0) AS total_out,
    COALESCE(SUM(CASE WHEN type = 'check_in'  THEN amount
                      WHEN type = 'check_out' THEN -amount
                      ELSE 0 END), 0) AS balance
  FROM public.transactions
  WHERE account_id = p_account_id
    AND user_id = auth.uid();
$$;
