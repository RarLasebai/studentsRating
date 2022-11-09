import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';

void printScreen(BuildContext context) {
  Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
    final doc = pw.Document();

    final image = await WidgetWraper.fromKey(
      key: context.read<StudentsBloc>().printKey,
      pixelRatio: 2.0,
    );

    doc.addPage(pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Expanded(
              child: pw.Image(image),
            ),
          );
        }));

    return doc.save();
  });
}
