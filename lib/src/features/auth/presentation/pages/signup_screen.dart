import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/validator_manager.dart';
import 'package:doctor_app/core/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:doctor_app/src/features/auth/presentation/pages/widgets/working_hour_widget.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      InkWell(
                        onTap: () async {
                          await BlocProvider.of<AuthCubit>(context).pickImage();
                        },
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        child: CircleAvatar(
                          radius: DimensionsHelper.widthPercentage(context, 15),
                          backgroundColor: ColorsHelper.primary,
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return CircleAvatar(
                                backgroundColor: ColorsHelper.lighGrey,
                                backgroundImage:
                                    BlocProvider.of<AuthCubit>(context)
                                                .pickedProfileImage !=
                                            null
                                        ? FileImage(
                                            BlocProvider.of<AuthCubit>(context)
                                                .pickedProfileImage!)
                                        : null,
                                radius: DimensionsHelper.widthPercentage(
                                    context, 14),
                                child: BlocProvider.of<AuthCubit>(context)
                                            .pickedProfileImage ==
                                        null
                                    ? Icon(
                                        Icons.person,
                                        color: ColorsHelper.white,
                                        size: DimensionsHelper.widthPercentage(
                                            context, 15),
                                      )
                                    : const SizedBox(),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.size20,
                      ),
                      CustomTextField(
                        labelText: "First Name",
                        icon: Icons.person,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .firstNameController,
                        hintText: 'Enter your first name',
                        validator: (value) =>
                            ValidatorManager().validateName(value!),
                      ),
                      const SizedBox(
                        height: AppSize.size15,
                      ),
                      CustomTextField(
                        labelText: "Middle Name",
                        icon: Icons.person,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .middleNameController,
                        hintText: 'Enter your middle name',
                        validator: (value) =>
                            ValidatorManager().validateName(value!),
                      ),
                      const SizedBox(
                        height: AppSize.size15,
                      ),
                      CustomTextField(
                        labelText: "Last Name",
                        icon: Icons.person,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .lastNameController,
                        hintText: 'Enter your last name',
                        validator: (value) =>
                            ValidatorManager().validateName(value!),
                      ),
                      const SizedBox(
                        height: AppSize.size15,
                      ),
                      CustomTextField(
                        labelText: "Phone Number",
                        icon: Icons.phone,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .signUpPhoneNumberController,
                        hintText: 'ex:09xxxxxxxx',
                        validator: (value) =>
                            ValidatorManager().validatePhone(value!),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: AppSize.size15,
                      ),
                      CustomTextField(
                        labelText: "Description",
                        icon: Icons.phone,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .descriptionController,
                        hintText: 'I\'m a good doctor',
                        validator: (value) {
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLine: 5,
                      ),
                      const SizedBox(
                        height: AppSize.size15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: "Session duration",
                              icon: Icons.person,
                              controller: TextEditingController(),
                              hintText: '30',
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.size10,
                          ),
                          Expanded(
                            child: CustomTextField(
                              labelText: "Days in advance",
                              icon: Icons.person,
                              controller: TextEditingController(),
                              hintText: '30',
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.size15,
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) {
                          final String day = BlocProvider.of<AuthCubit>(context)
                              .days
                              .keys
                              .elementAt(index);
                          return BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) => WorkingHourWidget(
                              day: day,
                              fromToControllers:
                                  BlocProvider.of<AuthCubit>(context).days[day]
                                      as List<FromToController>,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: AppSize.size15,
                        ),
                        itemCount: BlocProvider.of<AuthCubit>(context)
                            .days
                            .keys
                            .length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
