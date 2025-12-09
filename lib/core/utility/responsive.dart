import 'package:flutter/widgets.dart';

class Responsive {
  static late double _screenWidth;
  static late double _screenHeight;

  // Your Figma base sizes
  static const double _figmaWidth = 414;
  static const double _figmaHeight = 896;

  /// Initialize from any screen
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
  }

  /// Width scaling (Figma → device)
  static double w(double width) {
    return (width / _figmaWidth) * _screenWidth;
  }

  /// Height scaling (Figma → device)
  static double h(double height) {
    return (height / _figmaHeight) * _screenHeight;
  }

  /// Text scaling (optional)
  static double t(double size) {
    return w(size); // or use min(w, h) if needed
  }

  /// Padding (all sides)

  static double p(double value) => w(value);

  /// Horizontal padding

  static double ph(double value) => w(value);

  /// Vertical padding
  static double pv(double value) => h(value);

  // *** FONT SCALING ***
  static double f(double fontSize) => (fontSize / _figmaWidth) * _screenWidth;
}
