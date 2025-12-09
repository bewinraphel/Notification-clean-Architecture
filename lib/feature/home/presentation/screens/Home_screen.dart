import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/extensions/padding_extension.dart';
import 'package:boardingweek/feature/home/presentation/widget/category_section.dart';
import 'package:boardingweek/feature/home/presentation/widget/craze_deal_section.dart';
import 'package:boardingweek/feature/home/presentation/widget/header_section.dart';
import 'package:boardingweek/feature/home/presentation/widget/nearbystores_sction.dart';
import 'package:boardingweek/feature/home/presentation/widget/referal_section.dart';
import 'package:boardingweek/feature/home/presentation/widget/search_section.dart';
import 'package:boardingweek/feature/home/presentation/widget/top_pick_section.dart';
import 'package:boardingweek/feature/home/presentation/widget/trending_section.dart';
import 'package:boardingweek/feature/home/presentation/widget/view_stores.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            padding: 20.leftPad + 48.topPad,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(),
                31.hGap,
                SearchSection(),
                32.hGap,
                CategorySection(),
                14.hGap,
                TopPickSection(),
                32.hGap,
                TrendingSection(),
                33.hGap,
                CrazeDealSection(),
                32.hGap,
                ReferalSection(),
                32.hGap,
                NearbystoresSction(),
                52.hGap,
                ViewStores(),
                39.hGap,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
