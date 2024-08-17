import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/src/features/online_consultation/presentation/widget/clip_path_container.dart';
import 'package:doctor_app/src/features/posts/presentation/pages/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/flexible_appbar.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.white,
      appBar: appBar(title: "Posts",),
      body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 34.h),
            child: ListView.separated(
            itemBuilder: (context, index) => const PostCard(),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: 10,
                ),
          ),
        ClipPathContainer(),


    ],)
    );
  }
}
