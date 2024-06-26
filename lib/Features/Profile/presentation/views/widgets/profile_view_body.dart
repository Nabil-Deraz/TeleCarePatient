import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/Profile/presentation/views/widgets/custom_profile_column_list.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/navbarcubit/nav_bar_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/widgets/customButton.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomProfileColumnListWidget(),
          CustomButton(
            text: "Logout",
            backgroundColor: kRed,
            foregroundColor: kRed,
            onPressed: () {
              CacheHelper.clearAll();
              context.read<NavBarCubit>().changeIndex(0);
              GoRouter.of(context).go(AppRouter.kLoginView);
            },
          )
        ],
      ),
    );
  }
}
