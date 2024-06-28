import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/models/medical_records_model.dart';
import 'package:tecpatient/core/utils/styles.dart';

class CustomRowResultID extends StatelessWidget {
  const CustomRowResultID({
    super.key,
    required this.medicalRecordsModel,
  });

  final Data medicalRecordsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: "Analyze Results: ",
              style: Styles.Title14.copyWith(
                  color: kGreyDark, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: medicalRecordsModel.attributes!.testOrders,
                  style: Styles.Title14.copyWith(
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Text(
          "#${medicalRecordsModel.attributes!.patient!.data!.attributes!.regNum}",
          style: Styles.Title14.copyWith(color: kBlack),
        ),
      ],
    );
  }
}
