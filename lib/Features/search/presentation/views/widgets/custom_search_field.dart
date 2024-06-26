import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/navbarcubit/nav_bar_cubit.dart';
import 'package:tecpatient/Features/search/presentation/cubits/search_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.isFilled = false,
    this.fillColor = kGreyDark,
    required this.hintText,
    required this.controller,
  });
  final bool isFilled;
  final Color fillColor;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context).searchHospitals(controller.text);
        controller.clear();
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: kGreyDark,
        ),
        fillColor: fillColor,
        filled: isFilled,
        hintText: hintText,
        hintStyle: Styles.Title14.copyWith(color: kGreyDark),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kGreyLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kGreyLight, width: 0)),
      ),
    );
  }
}
