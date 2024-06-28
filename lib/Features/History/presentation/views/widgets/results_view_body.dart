import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tecpatient/Features/History/presentation/views/widgets/custom_results_appbar.dart';
import 'package:tecpatient/Features/History/presentation/views/widgets/custom_row_resultsID.dart';
import 'package:tecpatient/core/models/medical_records_model.dart';
import 'package:tecpatient/core/utils/styles.dart';

class ResultsViewBody extends StatelessWidget {
  const ResultsViewBody({super.key, required this.medicalRecordsModel});
  final Data medicalRecordsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomResultsAppBarRow(medicalRecordsModel: medicalRecordsModel),
          const SizedBox(
            height: 20,
          ),
          CustomRowResultID(medicalRecordsModel: medicalRecordsModel),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Prescription",
            style: Styles.Title20,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            medicalRecordsModel.attributes!.prescription!,
            style: Styles.Title14,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "PDFS",
            style: Styles.Title20,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                return getPDF(medicalRecordsModel)[index];
              },
              itemCount: getPDF(medicalRecordsModel).length,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Images",
            style: Styles.Title20,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                return getImgs(medicalRecordsModel)[index];
              },
              itemCount: getImgs(medicalRecordsModel).length,
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> getPDF(Data medicalRecords) {
  List<Widget> widgets = [];
  medicalRecords.attributes?.labFiles?.data?.forEach((element) async {
    if (element.attributes?.ext == ".pdf") {
      Permission.storage.request();
      widgets.add(const PDF().cachedFromUrl(
        element.attributes!.url!,
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => const Center(child: Text("Error loading PDF")),
      ));
    }
  });
  if (medicalRecords.attributes?.labFiles?.data?.isEmpty ?? true) {
    widgets.add(const Text("No files found"));
  }
  return widgets;
}

List<Widget> getImgs(Data medicalRecords) {
  List<Widget> widgets = [];
  medicalRecords.attributes?.labFiles?.data?.forEach((element) {
    if (element.attributes?.ext == ".jpg" ||
        element.attributes?.ext == ".png" ||
        element.attributes?.ext == ".jpeg" ||
        element.attributes?.ext == ".gif" ||
        element.attributes?.ext == ".webp") {
      widgets.add(Image.network(element.attributes!.url!));
    }
  });
  if (medicalRecords.attributes?.labFiles?.data?.isEmpty ?? true) {
    widgets.add(const Text("No files found"));
  }
  return widgets;
}
