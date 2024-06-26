import 'package:flutter/material.dart';

class CustomBottomNavBarDot extends StatelessWidget {
  final Function(int)? onChange;
  final int defaultSelectedIndex;
  final Color backgroundColor;
  final double radius;
  final bool showLabel;
  final List<String> textList;
  final List<IconData> iconList;

  const CustomBottomNavBarDot({
    super.key,
    required this.onChange,
    required this.defaultSelectedIndex,
    required this.backgroundColor,
    required this.radius,
    required this.showLabel,
    required this.textList,
    required this.iconList,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onChange,
      currentIndex: defaultSelectedIndex,
      backgroundColor: backgroundColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: showLabel,
      showUnselectedLabels: showLabel,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: List.generate(
        textList.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(iconList[index]),
          label: textList[index],
        ),
      ),
    );
  }
}
