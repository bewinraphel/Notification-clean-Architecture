import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return SizedBox(
      height: Responsive.h(23),
      width: Responsive.w(178),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/Vector.svg',
            width: Responsive.w(19),
            height: Responsive.h(22),
          ),
          Responsive.w(8).wGap,
          SizedBox(
            width: Responsive.w(128),
            height: Responsive.h(20),
            child: Text(
              'ABCD,New Delhi',
              style: AppTextStyle.headlingsmall.copyWith(
                fontSize: Responsive.f(16),
              ),
            ),
          ),

          SizedBox(
            width: Responsive.w(18),
            height: Responsive.h(15),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_down_rounded,

                color: AppColors.searchborder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
