import 'package:doctor_app/src/features/appointments/data/models/appointment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/image_widget.dart';
import '../../../../../core/widgets/text_data.dart';

Widget RecentPatient({
  required AppointmentModel nextPatient
}){
  return  Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w,),
    child: InkWell(
      onTap: (){},
      child: Container(
          height: 110.h,
          decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(30),
              gradient: StyleManager.purbleGradients
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Image_widget(image: null, width: 70),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 10.w, bottom: 8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nextPatient.patient.personalInformation.fullName,
                        style: StyleManager.fontBold20Black,
                      ),
                      Text_Data(text: 'Age',textstyle:StyleManager.fontRegular14black,
                        data: nextPatient.patient.age,
                      ),
                      Text_Data(text: 'Start', data: nextPatient.start_min,textstyle:StyleManager.fontRegular14black,),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ),
  );
}