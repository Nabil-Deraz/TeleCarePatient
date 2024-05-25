import 'package:flutter/material.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/assets.dart';

class filterSearch extends StatelessWidget {
  const filterSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromHeight(58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      backgroundColor: kPrimaryColor,
                      elevation: 3.0,
                     ),
                  child: Container(
                    width: 25,
                    height: 25,
                    child: Center(
                      child: Image.asset(AssetsData.filterpng),
                    ),
                  ),
                );
  }
}