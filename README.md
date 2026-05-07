# 💰 Finance Tracker — Flutter App

A clean, production-quality multi-account personal finance app built with Flutter + Supabase.

---

## ✨ Features

| Feature                                         | Status |
|-------------------------------------------------|---|
| Email & Password Auth (Supabase)                | ✅ |
| Multi-Account Management                        | ✅ |
| Check-In (Income) / Check-Out (Expense)         | ✅ |
| Balance Calculation per Account                 | ✅ |
| Search by Title, Amount, Note                   | ✅ |
| Filter: All / Today / Weekly / Monthly / Yearly | ✅ |
| PDF Export per Account                          | ✅ |
| Clean Architecture + BLoC with Freezed          | ✅ |

---

## 🏗️ Architecture

```
lib/
├── core/
│   ├── theme/
│   │   ├── app_colors.dart       # Design token color system
│   │   ├── app_text_styles.dart  # Typography system
│   │   └── app_theme.dart        # MaterialApp theme config
│   ├── widgets/
│   │   └── app_widgets.dart      # Reusable UI components
│   ├── utils/
│   │   └── formatters.dart       # Date / currency helpers
│   └── router/
│       └── app_router.dart       # GoRouter navigation
├── models/
│   └── models.dart               # Account, Transaction, enums
├── services/
│   ├── supabase_service.dart     # All Supabase API calls
│   └── pdf_service.dart          # PDF export (printing pkg)
└── features/
    ├── auth/
    │    ├── bloc/
    │    ├──screens/             # Login / Signup screen
    ├── accounts/
    │   ├── bloc/
    │   ├── screens/              # Accounts list screen
    │   └── widgets/              # AccountCard, AddAccountSheet
    └── transactions/
        ├── bloc/
        ├── screens/              # Transaction list screen
        └── widgets/              # TransactionTile, AddTransactionSheet
```

---

## 🗃️ Database Schema

### `accounts` table
| Column | Type | Description |
|---|---|---|
| `id` | UUID (PK) | Auto-generated |
| `user_id` | UUID (FK → auth.users) | Owner |
| `name` | TEXT (1–30 chars) | Account name |
| `color_index` | INT (0–5) | Avatar color |
| `created_at` | TIMESTAMPTZ | Auto-set |

### `transactions` table
| Column | Type | Description |
|---|---|---|
| `id` | UUID (PK) | Auto-generated |
| `account_id` | UUID (FK → accounts) | Parent account |
| `user_id` | UUID (FK → auth.users) | Owner |
| `title` | TEXT (1–100 chars) | Transaction title |
| `amount` | NUMERIC(12,2) | Positive amount |
| `type` | TEXT | `check_in` or `check_out` |
| `note` | TEXT (optional) | Extra details |
| `created_at` | TIMESTAMPTZ | Auto-set |

**Row Level Security** is enabled on both tables — users can only access their own data.

---

## 🚀 Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/Sunilk047/finance_tracker.git
cd finance_tracker
```

### 2. Create Supabase project
1. Go to [supabase.com](https://supabase.com) and create a new project
2. Copy your **Project URL** and **Anon Key** from Settings → API
3. Run `supabase_schema.sql` in the SQL Editor

### 3. Configure environment

Pass in `lib/main.dart`:
```dart
url: 'https://qluwcrdguizlatyslein.supabase.co',
anonKey: 'sb_publishable_Fddhu6EXZFQ1YgXZUbG_LA_WtFafOfu',
```

### 4. Install dependencies & run
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### 5. Build APK
```bash
flutter build apk --release
```

APK will be at: `build/app/outputs/flutter-apk/app-release.apk`

---

## 📦 Key Packages

| Package            | Purpose |
|--------------------|---|
| `supabase_flutter` | Auth + Database backend |
| `flutter_bloc`     | State management |
| `pdf` + `printing` | PDF export |
| `intl`             | Date/currency formatting |
| `iconsax`          | Icon set |
| `flutter_animate`  | Animations |

---

## 🎨 Design System

All design tokens are centralized:

- **Colors**: `lib/core/theme/app_colors.dart`
- **Typography**: `lib/core/theme/app_text_styles.dart`
- **Theme**: `lib/core/theme/app_theme.dart`
- **Reusable Widgets**: `lib/core/widgets/app_widgets.dart`

---

## 📄 License
MIT
