import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/helper/date_helper.dart';
import '../../../../../core/helper/time_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/elevated_button.dart';
import '../../../../../core/widgets/text_from_field.dart';
import '../cubits/cubit/cubit.dart';


Widget Fields({
  required context
}) {
  final formKey = GlobalKey<FormState>();
  ScheduleCubit cubit=ScheduleCubit.get(context);
  return Padding(
    padding: EdgeInsets.only(top: 290.h, left: 20.w,right: 20.w),
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("  Date",
            style: StyleManager.fontRegular16,
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(width: 650.w, child: TextField_def(
            controller: cubit.DateController,
            keyboardType: TextInputType.none,
            hintText: 'Add Date here',
            onTap: (){
              showDatePicker(context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2090)).then((value){
                if(value!=null) {
                  var date= DateHelper.dateFormat(date: value);
                  cubit.DateController.text = date;
                }
              });
            },
          )),

          SizedBox(
            height: 10.h,
          ),
          Text(
            "  Start Time",
            style: StyleManager.fontRegular16,
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(width: 650.w, child: TextField_def(
            hintText: 'Add Start Time',
            controller: cubit.FromController,
            keyboardType: TextInputType.none,
            onTap: (){
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value){
                if(value!=null){
                  var from=TimeHelper.Convert_Time_HM(Time: value);
                  cubit.FromController.text=from.toString();
                }
              });
            },
          )),
          SizedBox(
            height: 10.h,
          ),

          Text(
            "  End Time",
            style: StyleManager.fontRegular16,
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(width: 650.w, child: TextField_def(
            hintText: 'Add End Time',
            controller: cubit.ToController,
            keyboardType: TextInputType.none,
            onTap: (){
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value){
                if(value!=null){
                  var to=TimeHelper.Convert_Time_HM(Time: value);
                  cubit.ToController.text=to.toString();
                }
              });
            },
          )),
          Padding(
            padding:  EdgeInsets.only(left: 240.w,top: 20.h),
            child: CustomElevatedButton(onPressed: () {
              cubit.addSchedule(context);
            }, label: 'Add',buttonColor: ColorsHelper.primary,),
          )
        ],
      ),
    ),
  );
}