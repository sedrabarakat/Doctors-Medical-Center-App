import 'package:doctor_app/core/languages/app_localizations.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/theme_manager.dart';
import 'package:flutter/material.dart';

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.myTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      routerConfig: AppRouter.router,
    );
  }
}
