import 'package:boardingweek/core/constants/app_constants.dart';
import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/padding_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:flutter/material.dart';

class ReferalSection extends StatelessWidget {
  const ReferalSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Container(
      height: Responsive.h(88),
      width: Responsive.w(374),
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [ReferalText(), InvititaionSection(), GiftSection()],
      ),
    );
  }
}

class GiftSection extends StatelessWidget {
  const GiftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 274.leftPad + 5.64.topPad + 28.rightPad,
      child: Image.asset(Appconstants.gift),
    );
  }
}

class InvititaionSection extends StatelessWidget {
  const InvititaionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.leftPad + 41.topPad,
      child: Row(
        children: [
          SizedBox(
            child: Text.rich(
              TextSpan(
                text: 'Invite your friends & earn',
                style: AppTextStyle.searchtext.copyWith(
                  color: AppColors.white,
                  fontSize: Responsive.f(14),
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: ' 15% off',
                    style: AppTextStyle.nearbyTime.copyWith(
                      color: AppColors.white,
                      fontSize: Responsive.f(18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: 8.leftPad,
            child: Icon(Icons.arrow_circle_right, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class ReferalText extends StatelessWidget {
  const ReferalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.leftPad + 18.topPad,
      child: SizedBox(
        child: Text(
          'Refer & Earn',
          style: AppTextStyle.headlineMedium.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
