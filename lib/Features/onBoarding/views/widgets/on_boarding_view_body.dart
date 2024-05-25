import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/onBoarding/static/static.dart';
import 'package:tecpatient/Features/onBoarding/views/widgets/upper_indicator.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/styles.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  int currentPage = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        UpperIndicatorBoarding(
          num: currentPage,
        ),
        Expanded(
          flex: 2,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: onBoardingList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      onBoardingList[index].title,
                      style: Styles.Title24,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(onBoardingList[index].desc,
                        style: Styles.Title18.copyWith(
                          color: kGreyDark,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      onBoardingList[index].img,
                      height: MediaQuery.of(context).size.height * .5,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (currentPage == onBoardingList.length - 1) {
                    CacheHelper.saveData(key: "isOnBoard", value: true);
                    GoRouter.of(context).go(AppRouter.kGetStartedView);
                  } else {
                    setState(() {
                      currentPage++;
                      controller.animateToPage(
                        currentPage,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    backgroundColor: kPrimaryColor,
                    textStyle: Styles.Title13,
                    foregroundColor: kWhitecomp),
                child: Text(
                  currentPage == onBoardingList.length - 1 ? "Start" : "Next",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
