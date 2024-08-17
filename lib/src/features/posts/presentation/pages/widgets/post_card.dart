import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AssetsManager.profileImage),
              ),
              const SizedBox(
                width: AppSize.size10,
              ),
              Text(
                "Doctor Name",
                style: StyleManager.fontBold16,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: ColorsHelper.lighGrey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The best medical center in the world .... come visit us",
                  style: StyleManager.fontRegular16.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/images/test.jpeg',
                  width: DimensionsHelper.widthPercentage(context, 100) -
                      AppSize.screenPadding -
                      50,
                  fit: BoxFit.fitWidth,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up_alt,
                            color: ColorsHelper.primary,
                          ),
                        ),
                        Text(
                          '6',
                          style: StyleManager.fontRegular14.copyWith(
                            color: ColorsHelper.primary,
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mode_comment_outlined,
                        color: ColorsHelper.lighGrey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: ColorsHelper.lighGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: ColorsHelper.lighGrey,
          )
        ],
      ),
    );
  }
}
