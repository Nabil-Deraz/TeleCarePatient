// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:tecpatient/constants.dart';
// import 'package:tecpatient/controllers/onboarding_controller.dart';
// import 'package:google_fonts/google_fonts.dart';

// class OnBoardingPage extends StatelessWidget {
//   final _controller = OnBoardingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: SafeArea(
//         child: Stack(
//           children: [
//             PageView.builder(
//               controller: _controller.pageController,
//               onPageChanged: _controller.selectedPageIndex,

//               itemCount: _controller.OnBoardingPages.length,
//               itemBuilder: (context , index){
//               return Container(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min ,
//                   children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB( 20,120,20,0),
//                     child: Text(_controller.OnBoardingPages[index].title,style: GoogleFonts.inriaSans(
//                       textStyle: const TextStyle(fontSize: 24, color: Color(0xff455A64), fontWeight:  FontWeight.w600),
//                     )
//                     ),
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.fromLTRB( 20,10,20,0),
//                     child: Text(_controller.OnBoardingPages[index].description , style: GoogleFonts.inriaSans(
//                       textStyle: const TextStyle(fontSize: 16, color: Color(0xff455A64), fontWeight:  FontWeight.w400) ),),
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.fromLTRB( 20,30,20,0),
//                     child: SizedBox(
//                       height: MediaQuery.of(context).size.height*.3,
//                       child: Image.asset(_controller.OnBoardingPages[index].imageAsset,)),
//                   ),

//                 ],),
//               );
//             }),
//           Positioned(
//             bottom: 70,
//             left: 20,
//             child: Row(
//               children: List.generate(_controller.OnBoardingPages.length, (index) => Obx(

//                 () {
//                   return Container(
//                     margin: const EdgeInsets.all(4),
//                     width: 8.0, height:8, decoration: BoxDecoration(color:_controller.selectedPageIndex.value == index ? kPrimaryColor : Colors.grey,
//                      shape: BoxShape.circle),

//                   );
//                 }
//               )),
//             ),
//           ),
//           Positioned(
//             bottom: 70,
//             right: 20,
//             child: SizedBox(
//               height: 50,
//               width: 90,
//               child: FloatingActionButton( elevation: 0, backgroundColor: kPrimaryColor,
//               onPressed: (){
//                 _controller.forwardAction();
//               },
//               child: Text('Next'),),
//             )

//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tecpatient/Features/onBoarding/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingViewBody(),
      ),
    );
  }
}
