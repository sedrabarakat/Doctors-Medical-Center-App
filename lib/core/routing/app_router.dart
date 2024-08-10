import 'package:doctor_app/src/features/auth/presentation/pages/login_screen.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/signup_screen.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/verification_code_screen.dart';
import 'package:doctor_app/src/features/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/patient_profile_screen.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/patient_sessions_screen.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/personal_information_screen.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/session_information_screen.dart';
import 'package:doctor_app/src/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kLogin = '/login';
  static const kSignUp = '/sign_up';
  static const kVerificationCode = '/verification_code';
  static const kBottomNavigationScreen = '/bottom_navigation_screen';
  static const kPatientProfileScreen = '/patient_profile';
  static const kPatientPersonalInformationScreen =
      '$kPatientProfileScreen/personal_information';
  static const kPatientSessions = '$kPatientProfileScreen/patient_sessions';
  static const kSessionInformation = '$kPatientSessions/session_information';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: kVerificationCode,
        builder: (context, state) => const VerificationCodeScreen(),
      ),
      GoRoute(
        path: kBottomNavigationScreen,
        builder: (context, state) => const BottomNavigationScreen(),
      ),
      GoRoute(
        path: kPatientProfileScreen,
        builder: (context, state) => const PatientProfileScreen(),
        routes: [
          GoRoute(
            path: 'personal_information',
            builder: (context, state) => const PersonalInformationScreen(),
          ),
          GoRoute(
              path: 'patient_sessions',
              builder: (context, state) => const PatientSessionsScreen(),
              routes: [
                GoRoute(
                  path: 'session_information',
                  builder: (context, state) => const SessionInformationScreen(),
                )
              ])
        ],
      )
    ],
  );
}
