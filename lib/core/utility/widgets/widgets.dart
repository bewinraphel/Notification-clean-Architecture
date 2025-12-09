// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:boardingweek/core/constants/app_constants.dart';
import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/extensions/padding_extension.dart';
import 'package:boardingweek/core/utility/responsive.dart';

class HeadText extends StatelessWidget {
  final String title;
  const HeadText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Responsive.h(28),

            child: Text(
              title,
              style: AppTextStyle.headlineLarge.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: 16.rightPad,
            child: SizedBox(
              child: Text(
                'See all',
                style: AppTextStyle.headlingsmall.copyWith(
                  color: AppColors.searchborder,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final String loaction;
  final String? rating;
  const CardItems({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.loaction,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.h(200),
      width: Responsive.w(532),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 4,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: Responsive.w(12),
          crossAxisSpacing: Responsive.h(12),

          childAspectRatio: 0.35,
        ),

        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                height: Responsive.h(88),
                width: Responsive.w(80),
                decoration: BoxDecoration(),
                child: Image.asset(image),
              ),
              Responsive.w(12).wGap,
              SizedBox(
                height: Responsive.h(85),
                width: Responsive.w(158),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        name,
                        style: AppTextStyle.trendincardtext.copyWith(
                          fontSize: Responsive.f(15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: Responsive.h(5).topPad,
                      child: SizedBox(
                        child: Text(
                          category,
                          style: AppTextStyle.trendincardcaption.copyWith(
                            fontSize: Responsive.f(13),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: Responsive.h(2).topPad,
                      child: SizedBox(
                        child: Text(
                          loaction,
                          style: AppTextStyle.trendincardcaption.copyWith(
                            fontSize: Responsive.f(13),
                          ),
                        ),
                      ),
                    ),
                    rating == null
                        ? Container()
                        : Padding(
                            padding: Responsive.h(2).topPad,
                            child: SizedBox(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: Responsive.h(12),
                                    width: Responsive.w(12),
                                    child: Icon(Icons.star, size: 12),
                                  ),
                                  Padding(
                                    padding: Responsive.w(8).leftPad,
                                    child: Text(
                                      rating!,
                                      style: AppTextStyle.distance.copyWith(
                                        fontSize: Responsive.f(14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CardItemsVerticaly extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final String loaction;
  final String rating;
  final String time;
  const CardItemsVerticaly({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.loaction,
    required this.rating,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Responsive.h(32).hGap,
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 2,

      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(image: image),
            Responsive.w(12).wGap,
            RestaurantDetails(
              name: name,
              category: category,
              loaction: loaction,
              rating: rating,
              time: time,
            ),
          ],
        );
      },
    );
  }
}

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({
    super.key,
    required this.name,
    required this.category,
    required this.loaction,
    required this.rating,
    required this.time,
  });

  final String name;
  final String category;
  final String loaction;
  final String rating;
  final String time;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.w(287),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        name,
                        style: AppTextStyle.trendincardtext.copyWith(
                          fontSize: Responsive.f(18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: Responsive.h(5).topPad,
                      child: SizedBox(
                        child: Text(
                          category,
                          style: AppTextStyle.trendincardcaption.copyWith(
                            fontSize: Responsive.f(13),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: Responsive.h(2).topPad,
                      child: SizedBox(
                        child: Text(
                          loaction,
                          style: AppTextStyle.trendincardcaption.copyWith(
                            fontSize: Responsive.f(13),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: Responsive.h(16).topPad,
                      child: Container(
                        height: Responsive.h(16),
                        width: Responsive.w(48),
                        decoration: BoxDecoration(color: AppColors.topStore),
                        child: Center(
                          child: Text(
                            'Top Store',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.cardTitle.copyWith(
                              fontSize: Responsive.f(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: Responsive.w(0).leftPad + Responsive.w(0).topPad,
                child: SizedBox(
                  height: Responsive.h(39),
                  width: Responsive.w(74),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Responsive.h(16),
                        width: Responsive.w(47),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(child: Icon(Icons.star, size: 15)),
                            Padding(
                              padding: Responsive.w(6.47).leftPad,
                              child: Text(
                                rating,
                                style: AppTextStyle.distance.copyWith(
                                  fontSize: Responsive.f(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Responsive.h(20),
                        width: Responsive.w(74),
                        child: Text(time, style: AppTextStyle.nearbyTime),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          OffersSection(),
        ],
      ),
    );
  }
}

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.h(8).topPad,
      child: Container(
        height: Responsive.h(24),
        width: Responsive.w(278),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: AppColors.border)),
        ),
        child: Row(
          children: [
            Offer(offers: 'Upto 10% OFF', image: Appconstants.im),
            Padding(
              padding: Responsive.h(6).leftPad,
              child: Offer(
                offers: '3400+items available',
                image: Appconstants.groceryimg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.h(80),
      width: Responsive.w(72),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}

class Offer extends StatelessWidget {
  String offers;
  String image;
  Offer({super.key, required this.offers, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.h(16),

      child: Row(
        children: [
          SizedBox(
            height: Responsive.h(16),
            width: Responsive.w(16),
            child: Image.asset(image),
          ),
          Padding(
            padding: Responsive.h(8).leftPad,
            child: SizedBox(
              height: Responsive.h(16),

              child: Text(
                offers,
                style: AppTextStyle.nearbyTimeOFF.copyWith(
                  fontSize: Responsive.f(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
