import 'package:flutter/material.dart';

class DeviceVerifier {
  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDeviceSmall(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    const maxWidth = 350.0;

    return screenSize.width < maxWidth;
  }

  static double responsiveFontSize(BuildContext context) {
    if (isDeviceSmall(context)) {
      return 13;
    } else if (isPhone(context)) {
      return 17;
    } else if (isTablet(context)) {
      return 23;
    }
    return 25;
  }

  static double responsiveFontSizeSmall(BuildContext context) {
    if (isDeviceSmall(context)) {
      return 10;
    }

    return 13;
  }

  static double responsiveFontSizeBig(BuildContext context) {
    if (isDeviceSmall(context)) {
      return 20;
    } else if (isPhone(context)) {
      return 26;
    } else if (isTablet(context)) {
      return 36;
    }
    return 28;
  }

  static double responsiveIconSize(BuildContext context) {
    if (isDeviceSmall(context)) {
      return 16;
    } else if (isPhone(context)) {
      return 25;
    } else if (isTablet(context)) {
      return 30;
    }
    return 30;
  }

  static double responsiveListFontSize(BuildContext context) {
    if (isDeviceSmall(context)) {
      return 13;
    } else if (isPhone(context)) {
      return 18;
    } else {
      return 24;
    }
  }

  static double responsiveTitleFontSize(BuildContext context) {
    if (isDeviceSmall(context)) {
      return 14;
    } else if (isPhone(context)) {
      return 26;
    } else {
      return 36;
    }
  }
}
