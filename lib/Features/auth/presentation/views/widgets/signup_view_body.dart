import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/auth/data/static/static.dart';
import 'package:tecpatient/Features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:tecpatient/Features/auth/presentation/views/widgets/custom_drop_down_menu.dart';
import 'package:tecpatient/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/functions/alert.dart';
import 'package:tecpatient/core/widgets/customButton.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  // void initState() {
  //   context.read<AuthCubit>().getHospitals();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              showAlert(
                  title: "Perfecto",
                  message:
                      "Signed up Successfully Please wait until your account is confirmed",
                  context: context);
              context.read<AuthCubit>().initialState();
              GoRouter.of(context).go(AppRouter.kLoginView);
            }
            if (state is SignupError) {
              showAlert(
                  title: "Error",
                  message: "Problem in Signup",
                  context: context);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetsData.signup),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: "Name",
                hintText: "Enter your name",
                controller: context.read<AuthCubit>().nameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: "Phone Number",
                hintText: "Phone Number",
                keyboardType: TextInputType.phone,
                controller: context.read<AuthCubit>().phoneController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                isPassword: true,
                labelText: "Password",
                hintText: "Password",
                controller: context.read<AuthCubit>().passwordSignController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: "Email",
                hintText: "a@example.com",
                keyboardType: TextInputType.emailAddress,
                controller: context.read<AuthCubit>().emailController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: "National ID",
                hintText: "Expiry Date",
                maxLength: 14,
                keyboardType: TextInputType.number,
                controller: context.read<AuthCubit>().natidController,
              ),
              const SizedBox(height: 20),
              const CustomDropDownMenu(
                title: "Governorate",
                data: governoratesList,
                isGov: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "Sign up",
                backgroundColor: kPrimaryColor,
                foregroundColor: kWhitecomp,
                onPressed: () {
                  context.read<AuthCubit>().signup(context);
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: kGreyDark),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kLoginView);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
