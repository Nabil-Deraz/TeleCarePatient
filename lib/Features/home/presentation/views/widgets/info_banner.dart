import 'package:flutter/material.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/home_app_bar.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        height: MediaQuery.of(context).size.height *.32,
        width: MediaQuery.of(context).size.width *1,
        
        decoration:  const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(20),bottomEnd: Radius.circular(14)),
          color:  Color(0xff0070CD),
        ),
      ),
      HomeAppBar(),
     

      ] 
    );
    
    }
}