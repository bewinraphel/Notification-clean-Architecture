import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/extensions/padding_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return SizedBox(
      height: 48,
      width: 374,
      child: Row(
        children: [
          Container(
            padding: 14.leftPad + 15.rightPad + 12.topPad + 15.bottomPad,
            height: 48,
            width: 272,

            decoration: BoxDecoration(
              color: AppColors.searchcolor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search for products/stores',
                  style: AppTextStyle.searchtext,
                ),
                SvgPicture.asset('assets/svg/Vector-2.svg'),
              ],
            ),
          ),
          16.wGap,
          Notificationsection(notificationCount: 4),
          26.wGap,
          SvgPicture.asset('assets/svg/Group.svg'),
        ],
      ),
    );
  }
}

class Notificationsection extends StatelessWidget {
  const Notificationsection({super.key, required this.notificationCount});
  final int notificationCount;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 1. Get the current route location
        final String location = GoRouterState.of(context).uri.toString();

        // 2. ONLY push if we are NOT already on the notification page
        if (location != '/notification') {
          context.push('/notification');
        } else {
          print("DEBUG: Tap blocked - Already on notification screen");
        }
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 30,
        width: 30,

        child: Stack(
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 30,
              color: AppColors.red,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColors.red,
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 10, color: AppColors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
