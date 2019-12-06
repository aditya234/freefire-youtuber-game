class SizeScaleConfig {
  final double baseHeight = 736.0;
  final double baseWidth = 414.0;

  static double screenHeight;
  static double screenWidth;
  static double heightScaleRatio;
  static double widthScaleRatio;
  static double scaleFactor;

  void calculateScaleRatios() {
    heightScaleRatio = screenHeight / baseHeight;
    widthScaleRatio = screenWidth / baseWidth;
  }

  double scaleHeight(double actualHeight) {

    return actualHeight * heightScaleRatio * scaleFactor;
  }

  double scaleWidth(double actualWidth) {
    return actualWidth * widthScaleRatio * scaleFactor;
  }
}
