import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/posts/presentation/pages/widgets/post_card.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feed",
          style: StyleManager.fontMedium18.copyWith(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) => const PostCard(),
          separatorBuilder: (context, index) => const SizedBox(
            height: AppSize.size10,
          ),
          itemCount: 10,
          padding: const EdgeInsets.all(
            AppSize.screenPadding,
          ),
        ),
      ),
    );
  }
}
