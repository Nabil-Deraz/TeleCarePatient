import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecpatient/Features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/patient_name_cubit.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/errors/internetCheck.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/mu_bloc_observer.dart';

//main
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkInfoImpl().checkInternet();
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();

  runApp(const tecpatient());
}

class tecpatient extends StatelessWidget {
  const tecpatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PatientNameCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kBackgroundColor,
            textTheme:
                GoogleFonts.inriaSansTextTheme(ThemeData.dark().textTheme)),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
