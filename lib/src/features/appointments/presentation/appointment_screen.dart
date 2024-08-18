import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

import '../../profile_doctor/presentation/widgets/profileCard.dart';

class AppointmentScreen extends StatelessWidget {

  final List<Map<String, String>> appointments = [
    {'patientName': 'John Doe', 'date': '2024-08-20', 'time': '10:00'},
    {'patientName': 'Jane Smith', 'date': '2024-08-21', 'time': '15:30'},
    {'patientName': 'Michael Brown', 'date': '2024-08-22', 'time': '11:45'},
    {'patientName': 'Michael Brown', 'date': '2024-08-22', 'time': '11:45'},
    {'patientName': 'Michael Brown', 'date': '2024-08-22', 'time': '11:45'},
  ];

   AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments', style: StyleManager.fontExtraBold26,),
      ),
      body: ListView.builder(
        //padding:const EdgeInsets.all(15),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: DimensionsHelper.widthPercentage(context, 3),top: DimensionsHelper.heightPercentage(context, 1), left: DimensionsHelper.widthPercentage(context, 3)),
            child: appointmentCard(
              context,
              appointments[index]['patientName']!,
              appointments[index]['date']!,
              appointments[index]['time']!,
            ),
          );
        },
      ),
    );
  }
}
