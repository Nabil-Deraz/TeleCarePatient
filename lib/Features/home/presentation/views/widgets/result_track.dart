import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/styles.dart';

class ResultTrack extends StatefulWidget {
  const ResultTrack({super.key});

  @override
  State<ResultTrack> createState() => _ResultTrackState();
}

class _ResultTrackState extends State<ResultTrack> {
  int currentStep = 0;
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
        height: 120,
        width: 370,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Container(
                    width: 350,
                    height: 120,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: EasyStepper(
                    showScrollbar: true,
                    disableScroll: false,
                    lineStyle: LineStyle(
                        finishedLineColor: Color(0xff41BC63),
                        unreachedLineColor: Color(0xffCFCFCF),
                        activeLineColor: Color(0xff0070CD)),
                    activeStep: activeStep,
                    defaultStepBorderType: BorderType.normal,
                    activeStepTextColor: Colors.black87,
                    finishedStepTextColor: Colors.black87,
                    finishedStepBorderColor: Color(0xff41BC63),
                    finishedStepBackgroundColor: Color(0xff0070CD),
                    activeStepBorderColor: Color(0xff0070CD),
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
                          borderRadius: BorderRadius.circular(10),
                          child: Opacity(
                              opacity: activeStep >= 0 ? 1 : 0.3,
                              child: Image.asset(
                                AssetsData.resultInLabTrack,
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
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
                          borderRadius: BorderRadius.circular(10),
                          child: Opacity(
                              opacity: activeStep >= 0 ? 1 : 0.3,
                              child: Image.asset(
                                AssetsData.resultReady,
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
                              )),
                        ),
                        customTitle: Text('Results Are Ready',
                            textAlign: TextAlign.center,
                            style: Styles.Title8.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      EasyStep(
                        customStep: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Opacity(
                              opacity: activeStep >= 0 ? 1 : 0.3,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Image.asset(
                                    AssetsData.resultInReview,
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    alignment: Alignment.center,
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
                          borderRadius: BorderRadius.circular(10),
                          child: Opacity(
                              opacity: activeStep >= 0 ? 1 : 0.3,
                              child: Image.asset(
                                AssetsData.readyMakeAppointment,
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
                              )),
                        ),
                        customTitle: Text('Make Appointment',
                            textAlign: TextAlign.center,
                            style: Styles.Title8.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                    onStepReached: (index) =>
                        setState(() => activeStep = index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
