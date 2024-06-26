import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/Profile/presentation/manager/profile_cubit/cubit/profile_cubit.dart';
import 'package:tecpatient/Features/Profile/presentation/views/widgets/custom_editable_form_field.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/utils/styles.dart';
import 'package:tecpatient/core/widgets/customButton.dart';
import 'package:tecpatient/core/widgets/custom_loading.dart';

class ProfileInfoViewBody extends StatefulWidget {
  const ProfileInfoViewBody({super.key});

  @override
  State<ProfileInfoViewBody> createState() => _ProfileInfoViewBodyState();
}

class _ProfileInfoViewBodyState extends State<ProfileInfoViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileCubit>().initialState();
    context
        .read<ProfileCubit>()
        .getPatientInfo(CacheHelper.getData(key: 'regNum'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccessfully) {
          Future.delayed(const Duration(seconds: 1), () {
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
          });
        } else if (state is ProfileUpdateError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: kRed,
          ));
        }
      },
      builder: (context, state) {
        return state is ProfileLoaded
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: kPrimaryColor,
                          )),
                      Text(
                        'Your Email',
                        style: Styles.Title14.copyWith(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomEditableFormField(
                        controller:
                            context.read<ProfileCubit>().emailController,
                        readOnly: context.read<ProfileCubit>().emailReadOnly,
                        prefixIcon: const Icon(Icons.email_outlined),
                        onTap: () {
                          context.read<ProfileCubit>().editEmail();
                          print(context.read<ProfileCubit>().emailReadOnly);
                          if (!context.read<ProfileCubit>().emailReadOnly) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            });
                          }
                        },
                        isEditable: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Text(
                        'Phone number',
                        style: Styles.Title14.copyWith(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomEditableFormField(
                        maxLength: 11,
                        controller:
                            context.read<ProfileCubit>().phoneController,
                        readOnly: context.read<ProfileCubit>().phoneReadOnly,
                        prefixIcon: const Icon(Icons.phone_outlined),
                        onTap: () {
                          context.read<ProfileCubit>().editPhone();
                          print(context.read<ProfileCubit>().phoneReadOnly);
                          if (!context.read<ProfileCubit>().phoneReadOnly) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            });
                          }
                        },
                        isEditable: true,
                        keyboardType: TextInputType.phone,
                      ),
                      Text(
                        'Registration number',
                        style: Styles.Title14.copyWith(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomEditableFormField(
                        controller:
                            context.read<ProfileCubit>().regNumController,
                        readOnly: true,
                        prefixIcon: const Icon(Icons.tag),
                        onTap: null,
                        isEditable: false,
                      ),
                      Text(
                        'Password',
                        style: Styles.Title14.copyWith(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomEditableFormField(
                        hintText: '************',
                        controller: context.read<ProfileCubit>().passController,
                        readOnly: context.read<ProfileCubit>().passReadOnly,
                        prefixIcon: const Icon(Icons.lock_outline),
                        onTap: () {
                          context.read<ProfileCubit>().editPass();
                          print(context.read<ProfileCubit>().passReadOnly);
                          if (!context.read<ProfileCubit>().passReadOnly) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            });
                          }
                        },
                        isEditable: true,
                      ),
                      Text(
                        'National id',
                        style: Styles.Title14.copyWith(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomEditableFormField(
                        controller:
                            context.read<ProfileCubit>().natIdController,
                        readOnly: true,
                        prefixIcon: const Icon(Icons.assignment_ind_outlined),
                        onTap: null,
                        isEditable: false,
                      ),
                      Text(
                        'Address',
                        style: Styles.Title14.copyWith(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomEditableFormField(
                        controller:
                            context.read<ProfileCubit>().addressController,
                        readOnly: context.read<ProfileCubit>().addressReadOnly,
                        prefixIcon: const Icon(Icons.fmd_good_outlined),
                        onTap: () {
                          context.read<ProfileCubit>().editAddress();
                          print(context.read<ProfileCubit>().addressReadOnly);
                          if (!context.read<ProfileCubit>().addressReadOnly) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            });
                          }
                        },
                        isEditable: true,
                      ),
                      CustomButton(
                        text: "Submit",
                        backgroundColor: kGreen,
                        foregroundColor: kWhitecomp,
                        onPressed: () {
                          context
                              .read<ProfileCubit>()
                              .updateDoctorProfileData(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            : state is ProfileLoading
                ? CustomLoading()
                : Text("Error in Loading Your Data Try Again Later");
      },
    );
  }
}
