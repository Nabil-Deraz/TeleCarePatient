import 'package:flutter/material.dart';
import 'package:tecpatient/core/utils/assets.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Image.asset(
        AssetsData.heartLoadingLottie,
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .5,
        fit: BoxFit.contain,
      )),
    );
  }
}