import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/helper/string_helper.dart';

import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/toast_bar.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/patient_cubit.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/upload_download_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_tab_bar.dart';
import '../widgets/patient_card.dart';

class SessionInformationScreen extends StatelessWidget {
  const SessionInformationScreen({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: data['cubit'] as PatientCubit,
        ),
        BlocProvider(create: (context) => UploadDownloadCubit()),
      ],
      child: Builder(builder: (context) {
        return BlocListener<PatientCubit, PatientState>(
          listener: (context, state) {
            if (state is UploadingFileErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Session Details",
                style: StyleManager.fontMedium18.copyWith(
                  color: ColorsHelper.black,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorsHelper.black,
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppSize.screenPadding,
                    left: AppSize.screenPadding,
                    right: AppSize.screenPadding * 2,
                  ),
                  child: PatientCard(
                    patientName: data['patient'].userData.fullName,
                    gender: StringHelper.capitalizeFirstLetter(
                        data['patient'].gender),
                    age: data['patient'].age,
                    bloodType: data['patient'].bloodType,
                    sessionDate: data['session'].createdDate,
                  ),
                ),
                BlocBuilder<PatientCubit, PatientState>(
                  buildWhen: (previous, current) {
                    if (current is GetSessionLoadingState ||
                        current is GetSessionErrorState ||
                        current is GetSessionSuccessState) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  builder: (context, state) {
                    if (state is GetSessionLoadingState) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorsHelper.blue,
                          ),
                        ),
                      );
                    } else if (state is GetSessionSuccessState) {
                      return const CustomTabBarView();
                    } else {
                      //todo add the error widget
                      return const Expanded(
                        child: Text("something went wrong"),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
