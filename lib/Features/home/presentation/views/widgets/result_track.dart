import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';

class ResultTrack extends StatelessWidget {
  const ResultTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:  15.0),
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
                  )
                ),
              ),
               Center(
                 child: Container(
                  width: 360,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8),
                  )
                             ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}