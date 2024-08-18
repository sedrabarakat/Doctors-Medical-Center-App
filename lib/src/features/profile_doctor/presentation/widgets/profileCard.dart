import 'package:animations/animations.dart';
import 'package:doctor_app/core/widgets/image_widget.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/data/models/user_model.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/helper/dimension_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../data/models/schedule_model.dart';

Widget profileCard(String title, String text) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                StyleManager.fontMedium16.copyWith(color: ColorsHelper.black),
          ),
          Text(text,
              style: StyleManager.fontRegular14
                  .copyWith(color: ColorsHelper.black))
        ],
      ),
    ),
  );
}

Widget headerProfile(BuildContext context, String imageUrl) {
  return Stack(children: [
    Container(
      color: Colors.white,
      height: DimensionsHelper.heightPercentage(context, 35),
    ),
    Image.asset(
      'assets/images/doctor_profile_background.png',
      height: DimensionsHelper.widthPercentage(context, 55),
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    Positioned.fill(
      child: FloatingBubbles.alwaysRepeating(
        noOfBubbles: 15,
        colorsOfBubbles: const [
          ColorsHelper.primary,
          ColorsHelper.primaryDark,
        ],
        sizeFactor: 0.10,
        opacity: 50,
        paintingStyle: PaintingStyle.fill,
        shape: BubbleShape.circle,
        speed: BubbleSpeed.slow,
      ),
    ),
    Positioned(
      top: DimensionsHelper.heightPercentage(context, 4),
      left: DimensionsHelper.widthPercentage(context, 10),
      right: DimensionsHelper.widthPercentage(context, 10),
      child: Image.asset(
        'assets/images/doctor_profile.png',
        width: 60, // 2 * radius of CircleAvatar
        height: 250,
        fit: BoxFit.fill,
      ),
    )
  ]);
}

///////Appointment widgets
List<ScheduleModel> testSchedules = [
  ScheduleModel('Monday', ['09:00 AM - 11:00 AM', '01:00 PM - 03:00 PM']),
  ScheduleModel('Tuesday', ['10:00 AM - 12:00 PM', '02:00 PM - 04:00 PM']),
  ScheduleModel('Wednesday', ['08:00 AM - 10:00 AM', '12:00 PM - 02:00 PM']),
  ScheduleModel('Thursday', ['09:00 AM - 11:00 AM', '01:00 PM - 03:00 PM']),
  ScheduleModel('Friday', ['10:00 AM - 12:00 PM', '02:00 PM - 04:00 PM']),
  ScheduleModel('Saturday', ['09:00 AM - 11:00 AM']),
  ScheduleModel('Sunday', ['10:00 AM - 12:00 PM']),
];

Widget appointmentCard(
    BuildContext context, String patientName, String date, String time) {
  return OpenContainer(
    closedColor: Colors.transparent,
    openColor: Colors.white,
    closedElevation: 15,
    openElevation: 12,
    closedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    openShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    transitionType: ContainerTransitionType.fadeThrough,
    transitionDuration: const Duration(milliseconds: 600),
    closedBuilder: (context, openContainer) => GestureDetector(
      onTap: openContainer,
      child: Card(
        color: Colors.blue.shade50,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Image_widget(image: null),
                SizedBox(
                  width: 30.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: StyleManager.fontRegular18.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            color: ColorsHelper.primary),
                        const SizedBox(width: 8),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                          child: Text(
                            date,
                            key: ValueKey(date),
                            style: StyleManager.fontRegular18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.redAccent),
                        const SizedBox(width: 8),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(-1.0, 0.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                          child: Text(
                            '$time pm',
                            key: ValueKey(time),
                            style: StyleManager.fontRegular14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    ),
    openBuilder: (context, closeContainer) => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(25, 50, 25, 25),
      constraints: BoxConstraints(
        minHeight: 200,
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            patientName,
            style: StyleManager.fontMedium16.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.calendar_today,
                  color: Colors.blueAccent, size: 30),
              const SizedBox(width: 12),
              Text(
                date,
                style: StyleManager.fontRegular18,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.redAccent, size: 30),
              const SizedBox(width: 12),
              Text(
                '$time pm',
                style: StyleManager.fontRegular16,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget aboutTabSelectedColumn(
    UserModel user, List<String> availableDaysAndTime) {
  return Column(
    children: [
      profileCard('Description', user.description!),
      Row(
        children: [
          profileCard('Session Duration:', '15 min'),
          profileCard('Days in advance:    ', '21 Days '),
        ],
      ),
      Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ExpansionTile(
          title: const Text(
            'View Available Times',
            style: TextStyle(
              color: ColorsHelper.primary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          children: testSchedules.map((schedule) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorsHelper.primary.withOpacity(0.1),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: ColorsHelper.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            schedule.day,
                            style: const TextStyle(
                              color: ColorsHelper.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: schedule.times.map<Widget>((time) {
                        return ListTile(
                          leading: const Icon(Icons.access_time,
                              color: ColorsHelper.primary),
                          title: Text(
                            time,
                            style: const TextStyle(fontSize: 15),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              size: 14, color: Colors.grey),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ],
  );
}
