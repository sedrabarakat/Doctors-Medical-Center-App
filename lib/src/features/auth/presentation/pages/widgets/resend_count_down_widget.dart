import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class ResendCountDown extends StatelessWidget {
  const ResendCountDown({
    super.key,
    required this.onResendPressed,
    required this.secondsToWait,
  });
  final void Function()? onResendPressed;
  final Duration secondsToWait;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Did\'t receive the OTP? ',
          style: StyleManager.fontRegular16,
        ),
        BlocProvider.of<AuthCubit>(context).isFinished
            ? TextButton(
                onPressed: onResendPressed,
                child: Text(
                  'Resend',
                  style: StyleManager.fontMedium16.copyWith(
                    color: ColorsHelper.primary,
                  ),
                ),
              )
            : TimerCountdown(
                format: CountDownTimerFormat.minutesSeconds,
                spacerWidth: 2,
                timeTextStyle: StyleManager.fontMedium16.copyWith(
                  color: ColorsHelper.primary,
                ),
                enableDescriptions: false,
                onEnd: () {
                  BlocProvider.of<AuthCubit>(context).finishTime();
                },
                endTime: DateTime.now().add(
                  Duration(
                      seconds: BlocProvider.of<AuthCubit>(context).waitSeconds),
                ),
              ),
      ],
    );
  }
}
