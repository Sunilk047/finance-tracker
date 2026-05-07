import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../core/utils/formatters.dart';
import '../models/models.dart';

class PdfExportService {
  PdfExportService._();

  static Future<void> exportTransactions({
    required Account account,
    required List<Transaction> transactions,
    required double totalIn,
    required double totalOut,
  }) async {
    final pdf      = pw.Document();
    final font     = await PdfGoogleFonts.nunitoRegular();
    final fontBold = await PdfGoogleFonts.nunitoBold();
    final dateStr  = DateFormat('MMMM d, yyyy').format(DateTime.now());
    final balance  = totalIn - totalOut;

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (ctx) => [
        pw.Container(
          padding: const pw.EdgeInsets.all(20),
          decoration: pw.BoxDecoration(color: const PdfColor.fromInt(0xFF1A56DB), borderRadius: pw.BorderRadius.circular(12)),
          child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text('Finance Tracker', style: pw.TextStyle(font: fontBold, fontSize: 22, color: PdfColors.white)),
            pw.SizedBox(height: 4),
            pw.Text('${account.name} · Exported on $dateStr', style: pw.TextStyle(font: font, fontSize: 11, color: PdfColors.white)),
          ]),
        ),
        pw.SizedBox(height: 20),
        pw.Row(children: [
          _box('Total In',  AppFormatters.currency(totalIn),  const PdfColor.fromInt(0xFF0E9F6E), font, fontBold),
          pw.SizedBox(width: 12),
          _box('Total Out', AppFormatters.currency(totalOut), const PdfColor.fromInt(0xFFF05252), font, fontBold),
          pw.SizedBox(width: 12),
          _box('Balance',   AppFormatters.currency(balance),  const PdfColor.fromInt(0xFF1A56DB), font, fontBold),
        ]),
        pw.SizedBox(height: 24),
        pw.Text('Transactions (${transactions.length})', style: pw.TextStyle(font: fontBold, fontSize: 14)),
        pw.SizedBox(height: 10),
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
          columnWidths: {0: const pw.FlexColumnWidth(2.5), 1: const pw.FlexColumnWidth(1.2), 2: const pw.FlexColumnWidth(1), 3: const pw.FlexColumnWidth(1.5)},
          children: [
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF3F4F6)),
              children: ['Title', 'Amount', 'Type', 'Date'].map((h) => pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(h, style: pw.TextStyle(font: fontBold, fontSize: 10)))).toList(),
            ),
            ...transactions.map((tx) {
              final c = tx.isIncome ? const PdfColor.fromInt(0xFF0E9F6E) : const PdfColor.fromInt(0xFFF05252);
              return pw.TableRow(children: [
                pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(tx.title, style: pw.TextStyle(font: font, fontSize: 9))),
                pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text('${tx.isIncome ? '+' : '-'}₹${tx.amount.toStringAsFixed(2)}', style: pw.TextStyle(font: fontBold, fontSize: 9, color: c))),
                pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(tx.isIncome ? 'IN' : 'OUT', style: pw.TextStyle(font: fontBold, fontSize: 9, color: c))),
                pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(DateFormat('dd MMM yyyy').format(tx.createdAt), style: pw.TextStyle(font: font, fontSize: 9))),
              ]);
            }),
          ],
        ),
      ],
    ));

    await Printing.sharePdf(bytes: await pdf.save(), filename: '${account.name}_transactions_$dateStr.pdf');
  }

  static pw.Widget _box(String title, String value, PdfColor color, pw.Font font, pw.Font fontBold) {
    return pw.Expanded(child: pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(color: PdfColors.white, border: pw.Border.all(color: PdfColors.grey300), borderRadius: pw.BorderRadius.circular(8)),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(title, style: pw.TextStyle(font: font, fontSize: 9, color: PdfColors.grey600)),
        pw.SizedBox(height: 4),
        pw.Text(value, style: pw.TextStyle(font: fontBold, fontSize: 13, color: color)),
      ]),
    ));
  }
}