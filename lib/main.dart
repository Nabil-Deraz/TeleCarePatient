import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecpatient/Features/Profile/presentation/manager/profile_cubit/cubit/profile_cubit.dart';
import 'package:tecpatient/Features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/navbarcubit/nav_bar_cubit.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/patient_appointment_cubit.dart';
import 'package:tecpatient/Features/home/presentation/view_models/cubit/patient_result_track_cubit.dart';
import 'package:tecpatient/Features/search/presentation/cubits/search_cubit.dart';
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
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => PatientAppointmentCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => PatientResultTrackCubit()),
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
