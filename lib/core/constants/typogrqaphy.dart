import 'package:boardingweek/core/constants/color.dart';

import 'package:flutter/painting.dart';

class AppTextStyle {
  static const quicksand = 'Quicksand';

  static const headlingsmall = TextStyle(
    fontFamily: quicksand,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const headlineLarge = TextStyle(
    fontFamily: quicksand,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static const headlineMedium = TextStyle(
    fontFamily: quicksand,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const searchtext = TextStyle(
    fontFamily: quicksand,
    fontSize: 16,
    color: AppColors.searchColor,
    fontWeight: FontWeight.w500,
  );

  static const cardTitle = TextStyle(
    fontFamily: quicksand,
    fontSize: 8,
    color: AppColors.cardTitle,
    fontWeight: FontWeight.w500,
  );
  static const bannertiltle = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );
  static const checknowbutton = TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  ///trending
  static const trendincardtext = TextStyle(
    fontFamily: quicksand,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const trendincardcaption = TextStyle(
    fontFamily: quicksand,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const distance = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',

    fontWeight: FontWeight.w400,
  );
  static const exploreButton = TextStyle(
    fontFamily: 'Poppins',

    fontWeight: FontWeight.w600,
  );

  //nearby
  static const nearbyTime = TextStyle(
    fontFamily: quicksand,
    fontSize: 18,
    color: AppColors.time,
    fontWeight: FontWeight.w500,
  );
  static const nearbyTimeOFF = TextStyle(
    fontFamily: quicksand,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  ///button
  static const viewStoreButton = TextStyle(
    fontFamily: quicksand,
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  ///Notification
  static const notification = TextStyle(
    fontFamily: quicksand,
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
  static const notificationtime = TextStyle(
    fontFamily: quicksand,
    fontSize: 12,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
}
