// import 'package:flutter/material.dart';
// import 'package:tecpatient/Features/onBoarding/models/onboarding_info.dart';
// import 'package:get/state_manager.dart';
// import 'package:get/utils.dart';


// class OnBoardingController extends GetxController{

// var selectedPageIndex = 0.obs;
// bool get isLastPage => selectedPageIndex.value == OnBoardingPages.length - 1;
// var pageController = PageController();

// forwardAction(){
//      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
// }

// List<OnBoardingInfo> OnBoardingPages = [
//  OnBoardingInfo('Make an appointment that suits your schedule','Pick the date that goes best with your week and make sure not to miss it','assets/images/onboard1png.png'),
//   OnBoardingInfo('Provided with the best doctors to bring you the best medical care','doctors and consultants prescribe your tests & medicines','assets/images/onboard2png.png'),
//  OnBoardingInfo('All your Scans are sent to your doctor for analyzing the results','you can follow up the diagnosis process starting from the lab till your next appointment','assets/images/onboard3png.png'),

// ];

// }