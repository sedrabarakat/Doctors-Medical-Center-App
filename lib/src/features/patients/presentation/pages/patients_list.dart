import 'package:doctor_app/core/domain/services/locator.dart';
import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/list_cubit.dart';
import '../cubit/list_states.dart';
import '../widgets/patient_cell.dart';
import '../widgets/patients_listview.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            PatientListCubit(getIt())..getMyPatient(),
        child: BlocConsumer<PatientListCubit, Patients_ListStates>(
          listener: (context, state) {},
          builder: (context, state) {
            PatientListCubit cubit = PatientListCubit.get(context);
            return Scaffold(
              backgroundColor: ColorsHelper.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    patientListCon(),
                    PatientsListView(cubit: cubit),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
