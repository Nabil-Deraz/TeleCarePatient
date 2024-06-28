import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/patient_result_track_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/styles.dart';
import 'package:tecpatient/core/widgets/custom_loading.dart';

class ResultTrack extends StatefulWidget {
  const ResultTrack({super.key});

  @override
  State<ResultTrack> createState() => _ResultTrackState();
}

class _ResultTrackState extends State<ResultTrack> {
  @override
  void initState() {
    super.initState();
    context.read<PatientResultTrackCubit>().getTrackStep();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        height: MediaQuery.of(context).size.height * 0.3,
        child: BlocBuilder<PatientResultTrackCubit, PatientResultTrackState>(
          builder: (context, state) {
            return state is PatientResultTrackSuccess
                ? ListView.builder(
                    itemCount: state.medicalRecords.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                              ),
                              Positioned(
                                child: Text(
                                    state.medicalRecords.data?[index].attributes
                                            ?.medicalRecordId ??
                                        "M",
                                    style: Styles.Title16.copyWith(
                                        color: kWhitecomp,
                                        fontWeight: FontWeight.w600)),
                                top: MediaQuery.of(context).size.height * 0.001,
                              ),
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: EasyStepper(
                                      showScrollbar: true,
                                      disableScroll: false,
                                      lineStyle: const LineStyle(
                                          finishedLineColor: Color(0xff41BC63),
                                          unreachedLineColor: Color(0xffCFCFCF),
                                          activeLineColor: Color(0xff0070CD)),
                                      activeStep: int.parse(state
                                                  .medicalRecords
                                                  .data?[index]
                                                  .attributes
                                                  ?.presState ??
                                              '0') -
                                          1,
                                      defaultStepBorderType: BorderType.normal,
                                      activeStepTextColor: Colors.black87,
                                      finishedStepTextColor: Colors.black87,
                                      finishedStepBorderColor:
                                          const Color(0xff41BC63),
                                      finishedStepBackgroundColor: Colors.white,
                                      activeStepBorderColor:
                                          const Color(0xff0070CD),
                                      internalPadding: 0,
                                      showLoadingAnimation: false,
                                      stepRadius: 25,
                                      showStepBorder: true,
                                      stepBorderRadius: 15,
                                      borderThickness: 5,
                                      stepShape: StepShape.rRectangle,
                                      steps: [
                                        EasyStep(
                                          customStep: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Opacity(
                                                opacity: int.parse(state
                                                                    .medicalRecords
                                                                    .data?[
                                                                        index]
                                                                    .attributes
                                                                    ?.presState ??
                                                                '0') -
                                                            1 >=
                                                        0
                                                    ? 1
                                                    : 0.3,
                                                child: Image.asset(
                                                  AssetsData.resultInLabTrack,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                )),
                                          ),
                                          customTitle: Text('Lab',
                                              textAlign: TextAlign.center,
                                              style: Styles.Title8.copyWith(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        EasyStep(
                                          customStep: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Opacity(
                                                opacity: int.parse(state
                                                                    .medicalRecords
                                                                    .data?[
                                                                        index]
                                                                    .attributes
                                                                    ?.presState ??
                                                                '0') -
                                                            1 >=
                                                        1
                                                    ? 1
                                                    : 0.3,
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 6),
                                                    child: Image.asset(
                                                      AssetsData.resultInReview,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                      alignment:
                                                          Alignment.center,
                                                    ))),
                                          ),
                                          customTitle: Text('Results In Review',
                                              textAlign: TextAlign.center,
                                              style: Styles.Title8.copyWith(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        EasyStep(
                                          customStep: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Opacity(
                                                opacity: int.parse(state
                                                                    .medicalRecords
                                                                    .data?[
                                                                        index]
                                                                    .attributes
                                                                    ?.presState ??
                                                                '0') -
                                                            1 >=
                                                        2
                                                    ? 1
                                                    : 0.3,
                                                child: Image.asset(
                                                  AssetsData
                                                      .readyMakeAppointment,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                )),
                                          ),
                                          customTitle: Text('Make Appointment',
                                              textAlign: TextAlign.center,
                                              style: Styles.Title8.copyWith(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                      onStepReached: (index) => context
                                          .read<PatientResultTrackCubit>()
                                          .changeStep(index)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : state is PatientResultTrackLoading
                    ? CustomLoading()
                    : state is PatientResultTrackFailure
                        ? Center(child: Text(state.errorMessage))
                        : Container();
          },
        ),
      ),
    );
  }
}
