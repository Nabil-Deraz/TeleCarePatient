part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

final class NavBarIndex extends NavBarState {
  final int index;

  NavBarIndex({required this.index});
}
