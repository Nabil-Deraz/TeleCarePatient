import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/search/presentation/cubits/search_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/styles.dart';
import 'package:tecpatient/core/widgets/custom_loading.dart';

class CustomPatientCard extends StatelessWidget {
  const CustomPatientCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state is SearchLoaded
            ? Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBooking,
                            extra: state.hospitalModel.data![index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhitecomp,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kPrimaryColor, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.hospitalModel.data?[index].attributes
                                      ?.name ??
                                  "",
                              style: Styles.Title14.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                            ),
                            Text(
                              state.hospitalModel.data?[index].attributes!
                                      .address ??
                                  "",
                              style: Styles.Title14.copyWith(color: kBlack),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.hospitalModel.data?.length,
                ),
              )
            : state is SearchLoading
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLoading(),
                    ],
                  )
                : state is SearchFailed
                    ? Center(
                        child: Text(state.msg),
                      )
                    : Container();
      },
    );
  }
}
