import 'package:doctor_app/src/features/auth/presentation/pages/login_screen.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/signup_screen.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/verification_code_screen.dart';
import 'package:doctor_app/src/features/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:doctor_app/src/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../helper/token_helper.dart';

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

  static const kDoctorSchedule = '/doctor_schedule';
  static const kDoctorSpecificSchedule = '/specific_schedule';
  static const kAdd_schedule = '/add_schedule';


  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => (TokenHelper.hasToken)
            ?SplashScreen(pushRoute: kBottomNavigationScreen)
            :SplashScreen(pushRoute:kLogin),
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
      ),
      GoRoute(
        path: kDoctorSchedule,
        builder: (context, state){
          ScheduleCubit.get(context).getScheduleList(context);
          return DoctorSchedule();
        },
      ),
      GoRoute(
        path: kDoctorSpecificSchedule,
        builder: (context, state) => const SpacificSchedule(),
      ),
      GoRoute(
        path: kAdd_schedule,
        builder: (context, state) => const AddSchedule(),
      ),
    ],
  );
}
