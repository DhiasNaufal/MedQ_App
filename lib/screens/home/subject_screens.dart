import 'package:cdss_quiz/models/models.dart';
import 'package:cdss_quiz/widgets/common/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SfPdfViewer.asset(subjects[index]),
    );
  }
}
