import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/styles.dart';

class PatientsAppointments extends StatelessWidget {
  const PatientsAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:  15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text("Scan Appointments", style: Styles.Title20.copyWith(color : Color(0xff455A64))),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      height: 65,
                      width: 68,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                            
                              child: Column(
                                children: [
                                  Text("Mon", style: Styles.Title20.copyWith(color : Colors.white),),
                                  Text("13", style: Styles.Title24.copyWith(color : Colors.white),),
                                      
                                ],
                              ),
                              
                    ),
                    const SizedBox(width: 15,),
                     Stack(
                      children: [
                          Container(
                              height: 65,
                              width: 260,
                              decoration: BoxDecoration(
                                color: kWhitecomp,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0,),
                                    child: AspectRatio(
                                          aspectRatio: 0.2/0.3,
                                          child: Container(
                                            decoration:  const BoxDecoration(
                                              image:  DecorationImage(
                                               
                                                image: AssetImage(AssetsData.heartMri))
                                            ),
                                          ),),
                                  ),
                                const SizedBox(width: 15,),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 12.0 ,bottom:5 ),
                                   child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Heart MRI',
                                      style: Styles.Title11.copyWith(fontWeight: FontWeight.w700, color: Color(0xff000000),
                                      ) ,
 ),
                                      Text("8:00 AM - 12:00 PM", style: Styles.Title11.copyWith(color: Color(0xffA5A5A5), fontWeight: FontWeight.w400 ),)
                                                                   ]
                                                                 ),
                                 ),
                                ],
                              ),                          
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60, left: 13 ),
                      width: 198,
                      height: 43,
                      decoration: const BoxDecoration( color: kPrimaryColor , borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10) , bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)
                      ) ),
                      child: Row(
                        children: [
                          SizedBox(width: 15,),
                          Text('By', style: TextStyle( fontSize: 10, color: Color(0xffFFFFFF)),),
                          SizedBox(width: 16),
                          Text('Aswan Military Hospital', style: Styles.Title11.copyWith(fontWeight:FontWeight.w700, color: kWhitecomp ),),
                          SizedBox(width: 6),
                          AspectRatio(
                            aspectRatio: 0.1/0.2,
                          child: Container(
                                            decoration:  const BoxDecoration(
                                              image:  DecorationImage(
                                               
                                                image: AssetImage(AssetsData.militaryHospital))
                                            ),
                                          ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
          ],)]
        ),
          
    );
  }
}



