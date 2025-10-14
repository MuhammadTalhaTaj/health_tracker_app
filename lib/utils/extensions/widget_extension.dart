import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../res/components/sb.dart';

extension WidgetExtension on Widget {
  Widget toSkeleton({bool enable = true}) {
    return Skeletonizer(
      enabled: enable,
      effect:  ShimmerEffect(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.7),
        duration: Duration(seconds: 1),
      ),
      child: this,
    );
  }

  Widget toScrollableList({int count = 5, Axis scrollDirection = Axis.vertical}) {
    return ListView.separated(
      separatorBuilder: (context, index) => scrollDirection==Axis.vertical?SB.h(10):SB.w(10),
      itemCount: count,
      scrollDirection: scrollDirection,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return this;
      },
    );
  }


  Widget toGridView({int count = 5, Axis scrollDirection = Axis.vertical}) {
    return Expanded(
      child: GridView.builder(

        scrollDirection: scrollDirection,

        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return this;
        },
        itemCount: count,
      ),
    );
  }
}

extension ContainerWidthExtension on int {
  double? getContainerWidth(int listLength) {
    return listLength == this + 1 && listLength % 2 != 0
        ? Get.width
        : Get.width * 0.425;
  }
}
