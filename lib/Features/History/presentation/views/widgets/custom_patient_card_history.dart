import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/History/presentation/manager/cubits/history_cubit/history_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/functions/stateColorWidgetCheck.dart';
import 'package:tecpatient/core/utils/styles.dart';
import 'package:tecpatient/core/widgets/custom_loading.dart';

class CustomPatientCardHistory extends StatelessWidget {
  const CustomPatientCardHistory({
    super.key,
  });

  get kWhite => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return state is HistoryLoaded
            ? Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kResultView,
                            extra: state.medicalRecords.data![index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kPrimaryColor, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dr. ${state.medicalRecords.data![index].attributes!.doctor?.data?.attributes?.name ?? "No Doctor"}",
                                  style: Styles.Title14.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor),
                                ),
                                const Spacer(),
                                Text(
                                  "#${state.medicalRecords.data![index].attributes!.medicalRecordId}",
                                  style: Styles.Title14.copyWith(color: kBlack),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Analyze Results: ",
                                style: Styles.Title14.copyWith(
                                    color: kGreyDark,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: state.medicalRecords.data![index]
                                        .attributes!.prescription,
                                    style: Styles.Title14.copyWith(
                                        color: kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "By: ",
                                    style: Styles.Title14.copyWith(
                                        color: kGreyDark,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: state
                                                .medicalRecords
                                                .data![index]
                                                .attributes!
                                                .laboratory!
                                                .data
                                                ?.attributes
                                                ?.name ??
                                            "No Lab",
                                        style: Styles.Title14.copyWith(
                                            color: kBlack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                stateColorWidgetCheck(state.medicalRecords
                                    .data![index].attributes!.presState
                                    .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.medicalRecords.data!.length,
                ),
              )
            : state is HistoryLoading
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLoading(),
                    ],
                  )
                : state is HistoryError
                    ? Center(
                        child: Text(state.message),
                      )
                    : Container();
      },
    );
  }
}
