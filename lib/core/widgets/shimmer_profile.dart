import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helper/dimension_helper.dart';

Widget shimmerProfile(BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: DimensionsHelper.heightPercentage(context, 5),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 24,
                width: 150,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: DimensionsHelper.heightPercentage(context, 1),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                width: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: DimensionsHelper.heightPercentage(context, 2),
            ),
            Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 30,
                  width: DimensionsHelper.widthPercentage(context, 35),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: DimensionsHelper.heightPercentage(context, 2),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
