// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:tecpatient/Features/onBoarding/views/onBoarding_page.dart';
// import 'package:tecpatient/Features/splash/presentation/views/widgets/sliding_text.dart';
// import 'package:tecpatient/constants.dart';
// import 'package:tecpatient/core/utils/assets.dart';
// import 'package:flutter/cupertino.dart';

// class SplashViewbody extends StatefulWidget{
//   const  SplashViewbody({Key? key}) : super(key: key);

//   @override
//   State<SplashViewbody> createState() => _SplashViewbodyState();
// }

// class _SplashViewbodyState extends State<SplashViewbody> with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<Offset> slidingAnimation;

//   @override
//   void initState() {

//     super.initState();

//     initSlidingAnimation();
//     navigateToHome();
//   }

//   @override
//   void dispose(){

//       super.dispose();
//       animationController.dispose();
//   }

//   @override
//   Widget build(BuildContext context){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         SvgPicture.asset(AssetsData.logo),
//         const SizedBox(height: 4),
//         SlidingText(slidingAnimation: slidingAnimation)
//       ],
//     );
//   }

// void initSlidingAnimation() {
//     animationController = AnimationController(vsync: this ,duration: const Duration(seconds: 1));

//     slidingAnimation = Tween<Offset>(begin: const Offset(0, 2) , end: Offset.zero ).animate(animationController);

//     animationController.forward();
//   }

//   void navigateToHome() {
//     Future.delayed(const Duration(seconds: 2),(){

//         Get.to(()=> OnBoardingPage() , transition: Transition.fade , duration: kTransitionDuration);
//     }

//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/styles.dart';

import '../../../../../core/local/cache_helper.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              semanticsLabel: "logo",
              AssetsData.logo,
              width: MediaQuery.of(context).size.width * .3,
            ),
            Text(
              "TelEgyCare",
              style: Styles.Title30.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  void navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 2), () {
      if (CacheHelper.getData(key: "isOnBoard") == null) {
        GoRouter.of(context).go(AppRouter.kOnBoardingView);
      } else {
        GoRouter.of(context).go(AppRouter.kLoginView);
      }
    });
  }
}
