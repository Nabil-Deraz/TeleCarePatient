import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:tecpatient/Features/Profile/presentation/views/profile_view.dart';
import 'package:tecpatient/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:tecpatient/Features/search/presentation/views/search_view.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  int index = 0;
  List<Widget> routes = [
    const HomeViewBody(),
    const SearchViewBody(),
    const ProfileView()
  ];
  void changeIndex(int index) {
    emit(NavBarIndex(index: index));
  }
}
