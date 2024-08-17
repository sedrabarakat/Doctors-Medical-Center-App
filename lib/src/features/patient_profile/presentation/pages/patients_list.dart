import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/patient_cell.dart';

class PatientsList extends StatelessWidget{
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          patientListCon(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => patientCellList(
                tap: (){}
            ),
            separatorBuilder: (context, index) =>  const SizedBox(),
            itemCount: 10,
          ),
        ),
      ],),
    );
  }
}