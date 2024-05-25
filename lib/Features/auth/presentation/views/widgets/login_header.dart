import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AssetsData.logo,
              width: MediaQuery.of(context).size.width * .2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Welcome',
              style: Styles.Title24.copyWith(color: kPrimaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
