import 'package:go_router/go_router.dart';
import 'package:tecpatient/Features/auth/presentation/views/get_started_view.dart';
import 'package:tecpatient/Features/auth/presentation/views/login_view.dart';
import 'package:tecpatient/Features/auth/presentation/views/signup_view.dart';
import 'package:tecpatient/Features/home/presentation/views/home_view.dart';
import 'package:tecpatient/Features/onBoarding/views/onBoarding_page.dart';
import 'package:tecpatient/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onBoardingView';
  static const kGetStartedView = '/getStartedView';
  static const kSignupView = '/signupView';
  static const kLoginView = '/loginView';
  static const kHomeView = '/homeView';
  static const kAppointmentView = '/appointmentView';
  static const kConsultantView = '/consultantView';
  static const klabView = '/labView';
  static const kProfileView = '/profileView';
  static const kSearchView = '/searchView';
  static const kSettingsView = '/settingsView';
  static const kHistoryView = '/historyView';
  static const kChatView = '/chatView';
  static const kResultView = '/resultView';
  static const kAppointmentsPatientsDetailsView =
      '/appointmentsPatientsDetailsView';
  static const kNewMedicalReecordView = '/newMedicalRecordView';

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
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
    ],
  );
}
