import 'package:doctor_app/src/features/auth/presentation/pages/login_screen.dart';
import 'package:doctor_app/src/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kLogin = '/login';
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
    ],
  );
}
