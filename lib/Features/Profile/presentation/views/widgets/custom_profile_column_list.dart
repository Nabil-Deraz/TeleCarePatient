import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/Profile/data/static/static.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

class CustomProfileColumnListWidget extends StatelessWidget {
  const CustomProfileColumnListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: columnList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kPrimaryColor,
            ),
            child: ListTile(
              onTap: () {
                if (columnList[index].route != null) {
                  GoRouter.of(context).push(columnList[index].route!);
                }
              },
              leading: Image.asset(
                columnList[index].imageUrl,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width * .05,
              ),
              title: Text(
                columnList[index].title,
                style: Styles.Title18.copyWith(color: kWhitecomp),
              ),
              subtitle: Text(
                columnList[index].description,
                style: Styles.Title14.copyWith(color: kWhitecomp),
              ),
            ),
          );
        },
      ),
    );
  }
}
