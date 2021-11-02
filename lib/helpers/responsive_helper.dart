import 'package:flutter/material.dart';

class ResponseHelper {
  final double width;
  final double height;
  final double fontSize;
  final double titleFontSize;
  final double headingFontSize;
  final double appBarTitleSize;
  final Color appThemeColor;

  static ResponseHelper _instance;

  factory ResponseHelper({
    @required double width,
    @required double height,
    @required double fontSize,
    @required Color appThemeColor,
    @required double titleFontSize,
    @required double headingFontSize,
    @required double appBarTitleSize,
  }) {
    _instance ??= ResponseHelper._internal(
      width,
      height,
      fontSize,
      appThemeColor,
      titleFontSize,
      headingFontSize,
      appBarTitleSize,
    );
    return _instance;
  }

  ResponseHelper._internal(
    this.width,
    this.height,
    this.fontSize,
    this.appThemeColor,
    this.titleFontSize,
    this.headingFontSize,
    this.appBarTitleSize,
  );

  static ResponseHelper get instance {
    return _instance;
  }
}
