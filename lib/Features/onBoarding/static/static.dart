import 'package:tecpatient/Features/onBoarding/models/onboarding_info.dart';
import 'package:tecpatient/core/utils/assets.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      index: 0,
      title: "Make an appointment that suits your schedule",
      colored: ["appointment"],
      desc:
          "Pick the date that goes best with your week and make sure not to miss it",
      img: AssetsData.onBoarding1),
  OnBoardingModel(
      index: 1,
      title:
          "Provided with the best doctors to bring you the best medical care",
      desc: "doctors and consultants prescribe your tests & medicines",
      img: AssetsData.onBoarding2),
  OnBoardingModel(
      index: 2,
      title: "All your Scans are sent to your doctor for analyzing the results",
      desc:
          "you can follow up the diagnosis process starting from the lab till your next appointment",
      img: AssetsData.onBoarding3),
];
