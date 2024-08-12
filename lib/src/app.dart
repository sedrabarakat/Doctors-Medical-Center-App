import 'package:doctor_app/core/domain/services/locator.dart';
import 'package:doctor_app/core/languages/app_localizations.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/theme_manager.dart';
import 'package:doctor_app/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/online_consultation/presentation/cubit/cubit.dart';

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt()),
        ),
        BlocProvider(create: (context) => HomeCubit(getIt())),
        BlocProvider(create: (context) => ScheduleCubit(getIt())..getScheduleList(context))
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.myTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
