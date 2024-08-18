import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:doctor_app/core/widgets/image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/text_data.dart';

Widget patientCellList(
    {required GestureTapCallback tap, required PatientModel patient}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: InkWell(
      onTap: tap,
      child: Container(
          height: 140.h,
          decoration: BoxDecoration(
            color: Colors.indigoAccent.withOpacity(.2),
            borderRadius: BorderRadius.circular(30),
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
                        patient.userData.fullName,
                        style: StyleManager.fontBold20Black,
                      ),
                      Text_Data(
                        text: 'Age',
                        textstyle: StyleManager.fontBold14,
                        data: patient.age,
                      ),
                      Text_Data(
                        text: 'Gender',
                        data: patient.gender,
                        textstyle: StyleManager.fontBold14,
                      ),
                      Text_Data(
                        text: 'Work',
                        data:
                            "${(patient.proffesion!.length > 20) ? patient.proffesion!.substring(0, 20) : patient.proffesion!}..",
                        textstyle: StyleManager.fontBold14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ),
  );
}

Widget patientListCon() {
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20.w, top: 67.h, right: 20.w),
        child: Container(
            padding: EdgeInsets.only(left: 30.w),
            height: 130.h,
            width: 400.w,
            decoration: BoxDecoration(
                boxShadow: [StyleManager.shadow],
                gradient: StyleManager.indigoGradients,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: TextsColumn),
      ),
      Padding(
        padding: EdgeInsets.only(left: 140.w),
        child: Image.asset(
          'assets/images/gryDoctor.png',
          height: 235.h,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 220.h, left: 30.w),
        child: Text(
          "My Patients",
          style: StyleManager.fontBold20Black.copyWith(color: Colors.grey),
        ),
      ),
    ],
  );
}

Widget TextsColumn = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('All doctors', style: StyleManager.fontBold20white),
    Text(
      'Treat.',
      style: StyleManager.fontBold20white,
    ),
    Text(
      'but a good doctor',
      style: StyleManager.fontBold20white,
    ),
    Text(
      'lets Nature Heal',
      style: StyleManager.fontBold20white,
    )
  ],
);
