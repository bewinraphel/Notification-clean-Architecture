import 'package:boardingweek/core/constants/app_constants.dart';
import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/extensions/padding_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:boardingweek/feature/home/presentation/widget/top_pick_section.dart';
import 'package:flutter/material.dart';

class CrazeDealSection extends StatelessWidget {
  const CrazeDealSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return SizedBox(
      height: Responsive.h(197),
      width: Responsive.w(764),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSection(heading: 'Craze deals'),
          Responsive.h(12).hGap,
          CardSection(
            checkButton: false,
            totalheight: Responsive.h(160),
            totalwidth: Responsive.w(735),
            cardwidth: Responsive.w(344),
            cardlheight: Responsive.h(160),
            paddings: 210.leftPad + 2.22.topPad + 0.92.rightPad,
            image: Appconstants.crazyomage,
            imageheight: Responsive.h(197),
            imagewidth: Responsive.w(205),
            discountpaddings: 24.leftPad + 24.topPad,
            color: AppColors.black,
            title: 'Customer favourite top supermarkets',
            discountTextlheight: 54,
            discountTextStyle: AppTextStyle.exploreButton.copyWith(
              fontSize: Responsive.f(22),
            ),
            discountTextwidth: 239,
          ),
        ],
      ),
    );
  }
}
