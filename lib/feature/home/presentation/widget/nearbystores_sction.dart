import 'package:boardingweek/core/constants/appconstants.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:boardingweek/core/utility/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NearbystoresSction extends StatelessWidget {
  const NearbystoresSction({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return SizedBox(
      width: Responsive.w(532),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadText(title: 'Nearby stores'),
          Responsive.h(13).hGap,
          CardItemsVerticaly(
            image: Appconstants.veg,
            name: 'Freshly Baker',
            category: 'Sweet, North Indian',
            loaction: 'Site No -1 | 6.4km',
            rating: '4.1 ',
            time: '45 mins',
          ),
        ],
      ),
    );
  }
}
