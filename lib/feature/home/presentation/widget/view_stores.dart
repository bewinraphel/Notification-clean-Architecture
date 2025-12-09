import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:flutter/material.dart';

class ViewStores extends StatelessWidget {
  const ViewStores({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Center(
      child: Container(
        width: Responsive.w(240),
        height: Responsive.h(40),
        decoration: BoxDecoration(
          color: AppColors.button,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text('View all stores', style: AppTextStyle.viewStoreButton),
        ),
      ),
    );
  }
}
