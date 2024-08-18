import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/text_from_field.dart';
import '../../../online_consultation/presentation/widget/clip_path_container.dart';

Widget welcomeDr({
  required context
}) {
  HomeCubit cubit=HomeCubit.get(context);
  return Stack(
    children: [
      ClipPathContainer(height: 230.h),
      Padding(
        padding: EdgeInsets.only(left: 20.w, top: 140.h,right: 20.w),
        child: Container(
          height: 150.h,width: 400.w,
          decoration: BoxDecoration(
              boxShadow: [
                StyleManager.shadow
              ],
              gradient:  LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blue.withOpacity(.9),
                    Colors.blueAccent.withOpacity(.8),
                    Colors.indigoAccent.withOpacity(.7),
                  ]),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w,top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back',style: StyleManager.fontBold60,),
                Text('${HomeCubit.doctorModel!.userData.fullName}',style: StyleManager.fontBold60,),
              ],
            )
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 60.h,left: 20.w,right: 20.w),
        child: SizedBox(
            width: 400.w,
            child: TextField_def(
              Is_SuffixWidget: true,
              onTap: (){
                cubit.SetList();
              },
              onChanged: (value){
                cubit.search.text=value.toString();
                cubit.getPatient(search: cubit.search.text);
              },
              controller: cubit.search,
              SuffixWidget:IconButton(
                onPressed: (){
                  cubit.SetHome();
                  FocusScope.of(context).unfocus();
                  cubit.search.clear();
                },icon: Icon(Icons.cancel,color: ColorsHelper.primary,),
              ),
              hintText: 'Search for Patient',
             filled: true,fillColor: Colors.white24,
              borderStyle: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)
              ),
            )),
      ),
      Padding(
        padding: EdgeInsets.only(top: 150.h,left: 230.w),
        child: Image.asset('assets/images/med.png',height: 180.h,),
      )

    ],
  );
}