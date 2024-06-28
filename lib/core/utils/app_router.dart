import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/History/presentation/views/results_view.dart';
import 'package:tecpatient/Features/Profile/presentation/views/profile_info_view.dart';
import 'package:tecpatient/Features/Profile/presentation/views/profile_view.dart';
import 'package:tecpatient/Features/SuccessPage/presentation/views/success_page_view.dart';
import 'package:tecpatient/Features/auth/presentation/views/get_started_view.dart';
import 'package:tecpatient/Features/auth/presentation/views/login_view.dart';
import 'package:tecpatient/Features/auth/presentation/views/signup_view.dart';
import 'package:tecpatient/Features/booking/presentation/booking_view.dart';
import 'package:tecpatient/Features/home/presentation/views/home_view.dart';
import 'package:tecpatient/Features/onBoarding/views/onBoarding_page.dart';
import 'package:tecpatient/Features/splash/presentation/views/splash_view.dart';
import 'package:tecpatient/core/models/hospitals_model.dart';
import 'package:tecpatient/core/models/medical_records_model.dart' as md;

abstract class AppRouter {
  static const kOnBoardingView = '/onBoardingView';
  static const kGetStartedView = '/getStartedView';
  static const kSignupView = '/signupView';
  static const kLoginView = '/loginView';
  static const kHomeView = '/homeView';
  static const kAppointmentView = '/appointmentView';
  static const kConsultantView = '/consultantView';
  static const klabView = '/labView';
  static const kBooking = '/bookingView';
  static const kResultView = '/resultView';
  static const kBookingSuccessful = '/bookingSuccessfulView';
  static const kProfileView = '/profileView';
  static const kSearchView = '/searchView';
  static const kSettingsView = '/settingsView';
  static const kAppointmentsPatientsDetailsView =
      '/appointmentsPatientsDetailsView';
  static const kProfileInfoView = '/profileInfoView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
          path: kGetStartedView,
          builder: (context, state) => const GetStartedView()),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kProfileInfoView,
        builder: (context, state) => const ProfileInfoView(),
      ),
      GoRoute(
        path: kBooking,
        builder: (context, state) => BookingPage(
          data: state.extra as Data,
        ),
      ),
      GoRoute(
        path: kBookingSuccessful,
        builder: (context, state) => BookingSuccessfulPage(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kResultView,
        builder: (context, state) => ResultsView(
          medicalRecordsModel: state.extra as md.Data,
        ),
      )
    ],
  );
}
