import 'dart:ui';

import 'package:boardingweek/core/constants/app_constants.dart';
import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/extensions/padding_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:flutter/material.dart';

class TopPickSection extends StatelessWidget {
  const TopPickSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return SizedBox(
      height: Responsive.h(242),
      width: Responsive.w(764),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSection(heading: 'Top Pick For You'),
          Responsive.h(17).hGap,
          CardSection(
            checkButton: true,
            totalheight: Responsive.h(200),
            totalwidth: Responsive.w(764),
            cardwidth: Responsive.w(374),
            cardlheight: Responsive.h(200),
            paddings: 161.leftPad + 3.topPad + 8.rightPad,
            image: Appconstants.topPickImage,
            imageheight: Responsive.h(197),
            imagewidth: Responsive.w(205),
            title: 'DISCOUNT 25% ALL FRUITS',
            color: AppColors.discountbannerbackround,
            discountTextlheight: 76,
            discountTextStyle:AppTextStyle.bannertiltle.copyWith(fontSize: Responsive.f(20)) ,
            discountTextwidth: 126,
            discountpaddings: 24.leftPad + 55.topPad,
          ),
        ],
      ),
    );
  }
}

class CardSection extends StatelessWidget {
  double totalheight;
  Color? color;
  double totalwidth;
  double cardlheight;
  double cardwidth;
  EdgeInsetsGeometry paddings;
  String image;
  double imageheight;
  double imagewidth;
  String title;
    TextStyle? discountTextStyle;
  double discountTextlheight;
  double discountTextwidth;
  EdgeInsetsGeometry discountpaddings;
  CardSection({
    super.key,
    required this.checkButton,
    required this.totalwidth,
    required this.totalheight,
    required this.cardwidth,
    required this.cardlheight,
    required this.paddings,
    required this.image,
    required this.imageheight,
    required this.imagewidth,
    required this.title,
    required this.color,
    required this.discountTextlheight,
    required this.discountTextwidth,
    required this.discountpaddings,
    required this.discountTextStyle
  });
  bool checkButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: totalheight,
      width: totalwidth,
      child: ListView.separated(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Responsive.w(16).wGap,
        itemBuilder: (context, index) {
          return Container(
            height: cardlheight,
            width: cardwidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: color,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentGeometry.topLeft,
              children: [
                DiscountText(
                  discountTextStyle: AppTextStyle.bannertiltle.copyWith(fontSize: Responsive.f(20)),
                  paddings: discountpaddings,
                  discount: title,
                  discountTextlheight: discountTextlheight,
                  discountTextwidth: discountTextwidth,
                ),
                Responsive.h(17).hGap,
                checkButton ? CheckNowButton() : Explore(),
                IMageSection(
                  paddings: paddings,
                  image: image,
                  totalheight: imageheight,
                  totalwidth: imagewidth,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class IMageSection extends StatelessWidget {
  EdgeInsetsGeometry paddings;
  String image;
  double totalheight;
  double totalwidth;
  IMageSection({
    super.key,
    required this.paddings,
    required this.image,
    required this.totalheight,
    required this.totalwidth,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings,
      child: SizedBox(
        height: totalheight,
        width: totalwidth,
        child: Image.asset(image),
      ),
    );
  }
}

class CheckNowButton extends StatelessWidget {
  const CheckNowButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.leftPad + 145.topPad,
      child: Container(
        height: Responsive.h(32),
        width: Responsive.w(162),
        decoration: BoxDecoration(
          color: AppColors.checknowcolor,
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Center(
          child: SizedBox(
            height: Responsive.h(13),
            width: Responsive.w(85),
            child: Text(
              'CHECK NOW',
              style: AppTextStyle.checknowbutton.copyWith(
                fontSize: Responsive.f(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Explore extends StatelessWidget {
  const Explore({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 23.leftPad + 33.topPad,
      child: Center(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Explore',
                style: AppTextStyle.headlingsmall.copyWith(
                  color: AppColors.time,
                  fontSize: Responsive.f(16),
                ),
              ),
              Padding(
                padding: 0.39.leftPad,
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.time,
                  size: Responsive.f(17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscountText extends StatelessWidget {
  String discount;
  EdgeInsetsGeometry paddings;
  double discountTextlheight;
  double discountTextwidth;
  TextStyle? discountTextStyle;
  DiscountText({
    super.key,
    required this.discount,
    required this.discountTextlheight,
    required this.discountTextwidth,
    required this.paddings,
    required this.discountTextStyle
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings,
      child: SizedBox(
        height: Responsive.h(discountTextlheight),
        width: Responsive.w(discountTextwidth),
        child: Text(
          discount,
          style: AppTextStyle.bannertiltle.copyWith(fontSize: Responsive.f(20)),
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  String heading;
  TextSection({super.key, required this.heading});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.h(25),
      width: Responsive.w(166),
      child: Text(heading, style: AppTextStyle.headlineMedium),
    );
  }
}
