import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:doctor_app/core/domain/services/locator.dart';
import 'package:doctor_app/core/helper/token_helper.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/login_screen.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/signup_screen.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/verification_code_screen.dart';
import 'package:doctor_app/src/features/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_app/src/features/home/presentation/screen/home.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/patient_profile_screen.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/patient_sessions_screen.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/personal_information_screen.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/session_information_screen.dart';
import 'package:doctor_app/src/features/online_consultation/presentation/screen/add_schedule.dart';
import 'package:doctor_app/src/features/online_consultation/presentation/screen/doctor_schedule.dart';
import 'package:doctor_app/src/features/online_consultation/presentation/screen/specific_schedule.dart';
import 'package:doctor_app/src/features/posts/presentation/cubits/posts_cubit.dart';
import 'package:doctor_app/src/features/posts/presentation/pages/comment_screen.dart';
import 'package:doctor_app/src/features/posts/presentation/pages/new_post_screen.dart';
import 'package:doctor_app/src/features/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../src/features/appointments/presentation/screens/appointment_screen.dart';
import '../../src/features/appointments/presentation/screens/archive_appointment.dart';
import '../../src/features/online_consultation/presentation/cubits/cubit/cubit.dart';
import '../../src/features/online_consultation/presentation/screen/video_call.dart';

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
  static const kNewPost = '/new_post';
  static const kComment = '/comment_screen';
  static const kDoctorSchedule = '/doctor_schedule';
  static const kDoctorSpecificSchedule = '/specific_schedule';
  static const kAdd_schedule = '/add_schedule';
  static const kVideoCall = '/video_call';
  static const kAppointment = '/appointment_screen';
  static const kArchive = '/archive_appointment';
  static const kHome = '/home';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(pushRoute: kLogin),

        // TokenHelper.hasToken
        //     ? const SplashScreen(pushRoute: kBottomNavigationScreen)
        //     : const SplashScreen(pushRoute: kLogin),
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
        builder: (context, state) {
          BlocProvider.of<ScheduleCubit>(context).getScheduleList(context);
          return const BottomNavigationScreen();
        },
      ),
      GoRoute(
        path: kPatientProfileScreen,
        builder: (context, state) {
          PatientModel patient = state.extra as PatientModel;
          return PatientProfileScreen(
            patient: patient,
          );
        },
        routes: [
          GoRoute(
              path: 'personal_information',
              builder: (context, state) {
                PatientModel patient = state.extra as PatientModel;
                return PersonalInformationScreen(
                  patient: patient,
                );
              }),
          GoRoute(
            path: 'patient_sessions',
            builder: (context, state) {
              return PatientSessionsScreen(
                data: state.extra as Map<String, dynamic>,
              );
            },
            routes: [
              GoRoute(
                path: 'session_information',
                builder: (context, state) {
                  Map<String, dynamic> data =
                      state.extra as Map<String, dynamic>;
                  return SessionInformationScreen(
                    data: data,
                  );
                },
              )
            ],
          )
        ],
      ),
      GoRoute(
        path: kDoctorSchedule,
        builder: (context, state) {
          ScheduleCubit.get(context).getScheduleList(context);
          return const DoctorSchedule();
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
      GoRoute(path: kVideoCall, builder: (context, state) => const VideoCall()),
      GoRoute(
          path: kAppointment, builder: (context, state) => AppointmentScreen()),
      GoRoute(
          path: kHome,
          builder: (context, state) => BlocProvider(
                create: (context) => HomeCubit(getIt())..getComingAppointment(),
                child: const Home(),
              )),
      GoRoute(
          path: kArchive,
          builder: (context, state) => ArchiveAppointmentScreen()),
      GoRoute(
        path: kNewPost,
        builder: (context, state) {
          PostsCubit cubit = state.extra as PostsCubit;
          return NewPostScreen(
            cubit: cubit,
          );
        },
      ),
      GoRoute(
        path: kComment,
        builder: (context, state) {
          final cubit = state.extra as PostsCubit;
          return CommentScreen(
            cubit: cubit,
          );
        },
      ),
    ],
  );
}
