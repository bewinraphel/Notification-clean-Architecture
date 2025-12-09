import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:boardingweek/feature/home/data/datasource/category_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textsection(),
          Responsive.h(9).hGap,
          Category(),
          MoreButton(),
        ],
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'More',
          style: AppTextStyle.headlingsmall.copyWith(
            color: AppColors.searchborder,
          ),
        ),
        SizedBox(
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_down_rounded,

              color: AppColors.searchborder,
            ),
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoryData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: Responsive.w(114),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 0.64,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentGeometry.topRight,
              children: [
                Card(
                  elevation: 2,
                  color: AppColors.white,
                  child: SizedBox(
                    width: Responsive.w(70),
                    height: Responsive.h(70),

                    child: SizedBox(
                      height: Responsive.h(45),
                      width: Responsive.w(45),
                      child: SvgPicture.asset(
                        categoryData[index].svg!,
                        height: Responsive.h(45),
                        width: Responsive.w(45),
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
                categoryData[index].discount == null
                    ? SizedBox()
                    : Positioned(
                        top: 3,
                        child: Container(
                          height: Responsive.h(16),
                          width: Responsive.w(48),
                          decoration: BoxDecoration(
                            color: AppColors.carddiscount,

                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            categoryData[index].discount!,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.searchtext.copyWith(
                              color: Colors.white,
                              fontSize: Responsive.f(9),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            Responsive.h(8).hGap,
            SizedBox(
              width: Responsive.w(75),
              height: Responsive.h(39),
              child: Text(
                categoryData[index].tittle!,
                textAlign: TextAlign.center,
                style: AppTextStyle.cardTitle.copyWith(
                  fontSize: Responsive.f(14),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Textsection extends StatelessWidget {
  const Textsection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.h(28),

      child: Text(
        'What would you like to do today?',
        style: AppTextStyle.headlineLarge,
      ),
    );
  }
}
