import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecpatient/Features/search/presentation/cubits/search_cubit.dart';
import 'package:tecpatient/Features/search/presentation/views/widgets/custom_search_card.dart';
import 'package:tecpatient/Features/search/presentation/views/widgets/custom_search_field.dart';
import 'package:tecpatient/constants.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Hero(
        tag: 'search',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return CustomSearchField(
                    controller: context.read<SearchCubit>().controller,
                    fillColor: kWhitecomp,
                    isFilled: true,
                    hintText: 'Enter hospital name');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomPatientCard()
          ],
        ),
      ),
    );
  }
}
