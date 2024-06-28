import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/navbarcubit/nav_bar_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/widgets/custom_navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            return SafeArea(
              child: BlocProvider.of<NavBarCubit>(context)
                  .routes[state is NavBarIndex ? state.index : 0],
            );
          },
        ),
        drawer: const Drawer(),
        bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            return CustomBottomNavBarDot(
              onChange: (int index) {
                context.read<NavBarCubit>().changeIndex(index);
              },
              defaultSelectedIndex: state is NavBarIndex ? state.index : 0,
              backgroundColor: kWhitecomp,
              radius: 25,
              showLabel: true,
              textList: const [
                'Home',
                'Search',
                'History',
                'Profile',
              ],
              iconList: const [
                Icons.home_outlined,
                Icons.search,
                Icons.calendar_today_outlined,
                Icons.person,
              ],
            );
          },
        ));
  }
}
