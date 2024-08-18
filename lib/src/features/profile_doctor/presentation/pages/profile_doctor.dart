import 'package:doctor_app/src/features/profile_doctor/presentation/cubit/profile_doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/user_model.dart';
import '../../../../../core/domain/services/locator.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/helper/dimension_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/shimmer_profile.dart';
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
      create: (context) =>
      ProfileDoctorCubit(getIt())
        ..getDoctorProfile(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProfileDoctorCubit, ProfileDoctorState>(
            buildWhen: (previous, current) {
              return current is GetDoctorProfileLoadingState ||
                  current is GetDoctorProfileSuccessState ||
                  current is GetDoctorProfileErrorState;
            },
            builder: (context, state) {
              if (state is GetDoctorProfileLoadingState) {
                return  shimmerProfile(context);
              } else if (state is GetDoctorProfileSuccessState) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            headerProfile(context,state.doctorProfile.user.image!),
                        SizedBox(
                          height:
                          DimensionsHelper.heightPercentage(context, 5),
                        ),
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Dr.',
                                  style: StyleManager.fontBold16),
                              TextSpan(
                                  text:
                                  '${state.doctorProfile.user.firstName} ${state
                                      .doctorProfile.user.lastName}',
                                  style: StyleManager.fontBold24),
                            ])),
                        SizedBox(
                          height:
                          DimensionsHelper.heightPercentage(context, 1),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(AppSize.size10),
                              color: ColorsHelper.lighGrey),
                          width:
                          DimensionsHelper.widthPercentage(context, 35),
                          child: Row(
                            children: [
                              const Icon(Icons.phone),
                              Text(
                                state.doctorProfile.user.phoneNumber,
                                style: StyleManager.fontMedium16,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                          DimensionsHelper.heightPercentage(context, 2),
                        ),
                        Center(child: BlocBuilder<ProfileDoctorCubit,
                            ProfileDoctorState>(
                          builder: (context, state) {
                            return customTabBar(context);
                          },
                        )),
                        SingleChildScrollView(child: aboutTabSelectedColumn(state.doctorProfile)
                        )
                  ],
                ),)
              ,
              ]
              ,
              );
            }
              else if(state is GetDoctorProfileErrorState) return Text(state.error.toString()) ;
              else return shimmerProfile(context);
            },
          ),
        ),
      ),
    );
  }
}
