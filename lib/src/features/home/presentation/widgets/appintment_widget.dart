import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/image_widget.dart';
import 'package:doctor_app/core/widgets/text_data.dart';
import 'package:doctor_app/src/features/appointments/data/models/appointment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appointmentWidget({required AppointmentModel model}) {
  return Padding(
    padding: EdgeInsets.only(left: 25.w, right: 5.w, bottom: 2.h),
    child: Container(
      decoration: BoxDecoration(
        gradient: StyleManager.purbleGradients,
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade200,
      ),
      height: 210.h,
      width: 200.w,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Image_widget(image: null, width: 80),
          SizedBox(
            height: 20.h,
          ),
          Text(model.patient.userData.fullName),
          Text(model.date),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text_Data(
                  text: 'Time',
                  data: model.start_min,
                  textstyle: StyleManager.fontRegular14black),
            ],
          )
        ],
      ),
    ),
  );
}
