import 'package:boardingweek/core/constants/appconstants.dart';
 
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
 
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:boardingweek/core/utility/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return SizedBox(
      width: Responsive.w(532),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadText(title: 'Trending'),
          Responsive.h(13).hGap,
          CardItems(
            image: Appconstants.icecream,
            name: 'Mithandas Bhandar',
            category: 'Sweet, North Indian',
            loaction: '(Store location)  | 6.4km',
            rating: '4.1 | 45 mins',
          ),
        ],
      ),
    );
  }
}
