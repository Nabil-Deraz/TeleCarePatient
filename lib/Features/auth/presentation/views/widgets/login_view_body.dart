import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:tecpatient/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:tecpatient/Features/auth/presentation/views/widgets/login_header.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/assets.dart';
import 'package:tecpatient/core/utils/functions/alert.dart';
import 'package:tecpatient/core/widgets/customButton.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const LoginHeader(),
          const SizedBox(
            height: 20,
          ),
          // Reg No.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: context.read<AuthCubit>().regNumController,
              labelText: "Registration number",
              hintText: 'Enter your Reg Number',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              isPassword: true,
              labelText: "Password",
              hintText: 'Enter your Password',
              controller: context.read<AuthCubit>().passwordLoginController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // const CustomRowCcheckboxForgetPass(),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.2,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                }

                if (state is LoginError) {
                  showAlert(
                      color: kRed,
                      image: SvgPicture.asset(AssetsData.logo),
                      title: "Error",
                      message:
                          "You Should Try Again or Signup or check consultant checkbox",
                      context: context);
                }
                if (state is AuthLoading) {
                  showAlert(
                      title: "Loading",
                      message: "Please Wait ",
                      context: context);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kBackgroundColor,
                  text: 'Sign in',
                  onPressed: () {
                    context.read<AuthCubit>().login(context);
                    // GoRouter.of(context).go(AppRouter.kHomeView);
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: kGreyDark),
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignupView);
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
