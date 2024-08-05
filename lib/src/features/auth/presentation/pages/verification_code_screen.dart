import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/custom_progress_state_button.dart';
import 'package:doctor_app/core/widgets/toast_bar.dart';
import 'package:doctor_app/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RequestCodeErrorState) {
          ToastBar.onNetworkFailure(
            context,
            networkException: state.error,
            title: "Error",
          );
        } else if (state is RequestCodeSuccessState) {
          ToastBar.onSuccess(context, message: state.message, title: "Success");
        } else if (state is VerifyCodeErrorState) {
          ToastBar.onNetworkFailure(
            context,
            networkException: state.error,
            title: "Error",
          );
        } else if (state is VerifyCodeSuccessState) {
          ToastBar.onSuccess(
            context,
            message: "Login in successfully",
            title: "Success",
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            Positioned.fill(
              child: FloatingBubbles.alwaysRepeating(
                noOfBubbles: 15,
                colorsOfBubbles: const [
                  ColorsHelper.primary,
                  ColorsHelper.primaryDark,
                ],
                sizeFactor: 0.10,
                opacity: 50,
                paintingStyle: PaintingStyle.fill,
                shape: BubbleShape.circle,
                speed: BubbleSpeed.slow,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(AppSize.screenPadding),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: DimensionsHelper.heightPercentage(context, 50) -
                            AppSize.screenPadding * 2,
                        child: SvgPicture.asset(
                          AssetsManager.verificationCode,
                          width: DimensionsHelper.widthPercentage(context, 60),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        height: DimensionsHelper.heightPercentage(context, 50) -
                            AppSize.screenPadding * 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'OTP Verification',
                              style: StyleManager.fontBold24.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.size15,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Enter the OTP sent to ",
                                    style: StyleManager.fontMedium16.copyWith(
                                      color: ColorsHelper.lighGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: BlocProvider.of<AuthCubit>(context)
                                        .phoneNumberController
                                        .text,
                                    style: StyleManager.fontMedium16.copyWith(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.size30,
                            ),
                            Pinput(
                              length: 6,
                              onCompleted: (value) {
                                BlocProvider.of<AuthCubit>(context).code =
                                    value;
                              },
                              cursor: Container(
                                height: 15,
                                width: 1,
                                color: ColorsHelper.black,
                              ),
                              defaultPinTheme: PinTheme(
                                width: 56,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: ColorsHelper.lighGrey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textStyle: StyleManager.fontRegular14.copyWith(
                                  color: ColorsHelper.black,
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 56,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: ColorsHelper.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textStyle: StyleManager.fontRegular14.copyWith(
                                  color: ColorsHelper.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.size20,
                            ),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return CustomStateButton(
                                  onPressed: () async {
                                    await BlocProvider.of<AuthCubit>(context)
                                        .verifyCode();
                                  },
                                  currentState:
                                      BlocProvider.of<AuthCubit>(context)
                                          .verifyButtonState,
                                  label: "Submit",
                                  height: 46,
                                );
                              },
                            ),
                            const Spacer(),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return ResendCountDown(
                                  secondsToWait: Duration(
                                      seconds:
                                          BlocProvider.of<AuthCubit>(context)
                                              .waitSeconds),
                                  onResendPressed: () {
                                    BlocProvider.of<AuthCubit>(context)
                                        .requestCode();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

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
