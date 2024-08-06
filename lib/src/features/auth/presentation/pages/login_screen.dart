import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/utils/validator_manager.dart';
import 'package:doctor_app/core/widgets/custom_progress_state_button.dart';
import 'package:doctor_app/core/widgets/custom_text_field.dart';
import 'package:doctor_app/core/widgets/toast_bar.dart';
import 'package:doctor_app/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/widgets/text_label_text_button_widget.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          context.pushReplacement(AppRouter.kVerificationCode);
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
                        SvgPicture.asset(
                          AssetsManager.loginImage,
                          height:
                              DimensionsHelper.heightPercentage(context, 50) -
                                  AppSize.screenPadding * 2,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          height:
                              DimensionsHelper.heightPercentage(context, 50) -
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
                              Text(
                                "We will send you a one Time Password on this mobile number",
                                style: StyleManager.fontMedium16.copyWith(
                                  color: ColorsHelper.lighGrey,
                                ),
                              ),
                              const SizedBox(
                                height: AppSize.size30,
                              ),
                              CustomTextField(
                                labelText: "Mobile number",
                                icon: Icons.phone,
                                controller: BlocProvider.of<AuthCubit>(context)
                                    .phoneNumberController,
                                hintText: "ex:09xxxxxxxx",
                                validator: (value) =>
                                    ValidatorManager().validatePhone(value!),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: AppSize.size20,
                              ),
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return CustomStateButton(
                                    onPressed: () async {
                                      await BlocProvider.of<AuthCubit>(context)
                                          .requestCode();
                                    },
                                    currentState:
                                        BlocProvider.of<AuthCubit>(context)
                                            .loginButtonState,
                                    label: "Send Code",
                                    height: 46,
                                  );
                                },
                              ),
                              const Spacer(),
                              TextLabelTextButtonWidget(
                                label: 'Don\'t have an account?',
                                textButtonLabel: 'Sign up',
                                onPressed: () {
                                  context.pushReplacement(AppRouter.kSignUp);
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
          ),
        ),
      ),
    );
  }
}
