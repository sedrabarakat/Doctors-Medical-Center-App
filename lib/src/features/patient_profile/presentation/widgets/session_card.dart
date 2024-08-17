import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({
    super.key,
    required this.isOpen,
    required this.onTap,
  });
  final bool isOpen;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsHelper.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: .2,
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSize.size10),
        child: Row(
          children: [
            const Text(
              '09:',
              style: TextStyle(
                color: ColorsHelper.primary,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '00\n',
                    style: TextStyle(
                      color: ColorsHelper.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'AM',
                    style: TextStyle(
                      color: ColorsHelper.lighGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppSize.size10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "date : ",
                        style: StyleManager.fontExtraBold14
                            .copyWith(color: ColorsHelper.primaryLight),
                      ),
                      TextSpan(
                        text: "2020/12/1",
                        style: StyleManager.fontRegular14
                            .copyWith(color: ColorsHelper.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "price: ",
                        style: StyleManager.fontExtraBold14.copyWith(
                          color: ColorsHelper.primaryLight,
                        ),
                      ),
                      TextSpan(
                        text: "100",
                        style: StyleManager.fontRegular14
                            .copyWith(color: ColorsHelper.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: isOpen ? ColorsHelper.turquoise : Colors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.size10,
                vertical: 5,
              ),
              child: Text(
                isOpen ? "Opened" : "Closed",
                style: StyleManager.fontRegular14.copyWith(
                  color: ColorsHelper.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
