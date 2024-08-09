import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.backButton = false,
    this.onBackButtonPressed,
  });
  final bool backButton;
  final void Function()? onBackButtonPressed;
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: statusBarHeight,
        horizontal: 5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsHelper.primary.withOpacity(.8),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title and action,
          Row(
            children: [
              backButton
                  ? IconButton(
                      onPressed: onBackButtonPressed,
                      icon: const Icon(Icons.arrow_back_ios),
                      color: ColorsHelper.white,
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                      color: ColorsHelper.white,
                    ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                color: ColorsHelper.white,
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.size10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.size30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Omar Fostok",
                      style:
                          StyleManager.fontBold24.copyWith(color: Colors.white),
                    ),
                    Text(
                      "Single",
                      style: StyleManager.fontRegular14
                          .copyWith(color: ColorsHelper.white),
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorsHelper.white,
                  child: CircleAvatar(
                    backgroundColor: ColorsHelper.primaryDark,
                    radius: 29,
                    child: Icon(
                      Icons.person,
                      color: ColorsHelper.white,
                      size: DimensionsHelper.widthPercentage(context, 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
