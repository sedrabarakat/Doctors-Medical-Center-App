import 'package:doctor_app/src/features/profile_doctor/presentation/cubit/profile_doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/user_model.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/helper/dimension_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../widgets/customTabBar.dart';
import '../widgets/profileCard.dart';

class ProfileDoctor extends StatelessWidget {
  const ProfileDoctor({super.key});

  @override
  Widget build(BuildContext context) {

    //just for testing ui 😶‍🌫️
    final UserModel user = UserModel(
        id: 22,
        firstName: "Hazel",
        middleName: "Dee",
        lastName: "Macejkovic",
        phoneNumber: "0949380470",
        userType: "doctor",
        image: "https://via.placeholder.com/640x480.png",
        description:
            "Nihil sed ipsum recusandae nulla. Non nisi omnis similique in fugit. Quaerat quo aut animi ut natus id eaque.",
        rememberToken: "SlK8Cys82y");

    List<String> availableDaysAndTimes = [
      'Sun: From 5 To 8',
      'Mon: From 5 To 8',
      'Tue: From 5 To 8',
      'Wed: From 5 To 8',
      'Thu: From 5 To 8',
      // Add more as needed
    ];

    return BlocProvider(
      create: (context) => ProfileDoctorCubit(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    headerProfile(context,'assets/images/doctor_profile_background.png' ),
                    SizedBox(
                      height: DimensionsHelper.heightPercentage(context, 5),
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(text: 'Dr.', style: StyleManager.fontBold16),
                          TextSpan(
                              text:
                              '${user.firstName} ${user.middleName} ${user.lastName}',
                              style: StyleManager.fontBold24),
                        ])),
                    SizedBox(
                      height: DimensionsHelper.heightPercentage(context, 1),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.size10),
                          color: ColorsHelper.lighGrey),
                      width: DimensionsHelper.widthPercentage(context, 35),
                      child: Row(
                        children: [
                          const Icon(Icons.phone),
                          Text(
                            user.phoneNumber,
                            style: StyleManager.fontMedium16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: DimensionsHelper.heightPercentage(context, 2),
                    ),
                    Center(child: BlocBuilder<ProfileDoctorCubit, ProfileDoctorState>(
                      builder: (context, state) {
                        return customTabBar(context);
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.all(AppSize.size15),
                      child: SingleChildScrollView(child:
                      BlocBuilder<ProfileDoctorCubit, ProfileDoctorState>(
                        builder: (context, state) {
                          if (state is ProfileDoctorAboutTabSelected) {
                            return aboutTabSelectedColumn(user, availableDaysAndTimes);
                          } else if (state is ProfileDoctorAppointmentTabSelected) {
                            return Container();
                          } else {
                            return Container(); // Default or initial state
                          }
                        },
                      )),
                    )
                  ],
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
