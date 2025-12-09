import 'package:flutter/material.dart';

extension PaddingExt on num {
  EdgeInsets get allPad => EdgeInsets.all(toDouble());
  EdgeInsets get hPad => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vPad => EdgeInsets.symmetric(vertical: toDouble());
}

extension OnlyPaddingExt on num {
  EdgeInsets get leftPad => EdgeInsets.only(left: toDouble());
  EdgeInsets get rightPad => EdgeInsets.only(right: toDouble());
  EdgeInsets get topPad => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottomPad => EdgeInsets.only(bottom: toDouble());
}
