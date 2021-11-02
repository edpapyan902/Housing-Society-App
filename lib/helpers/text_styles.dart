import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_app/helpers/app_constants.dart';
import 'package:housing_app/helpers/responsive_helper.dart';

class TextStyles {
  static TextStyle smallTxtStyle = GoogleFonts.catamaran(
      textStyle: TextStyle(
    fontSize: ResponseHelper.instance.fontSize - 2,
  ));

  static TextStyle smallTxtStyleBold = GoogleFonts.catamaran(
      textStyle: TextStyle(
          fontSize: ResponseHelper.instance.fontSize - 2,
          fontWeight: FontWeight.w600));

  static TextStyle regularTxtStyle = GoogleFonts.catamaran(
      textStyle: TextStyle(
    fontSize: ResponseHelper.instance.fontSize,
    color: AppConstants.textThemeColor,
  ));

  static TextStyle medTxtStyle = GoogleFonts.catamaran(
      textStyle: TextStyle(
    fontSize: ResponseHelper.instance.fontSize + 2,
    color: AppConstants.textThemeColor,
  ));
  static TextStyle largeTxtStyle = GoogleFonts.catamaran(
      textStyle: TextStyle(
    color: AppConstants.textThemeColor,
    fontSize: ResponseHelper.instance.fontSize + 4,
  ));

  static TextStyle largeSemiBoldTxtStyle = GoogleFonts.catamaran(
      textStyle: TextStyle(
    color: AppConstants.textThemeColor,
    fontSize: ResponseHelper.instance.fontSize + 4,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle extralargeTxtStyleBold = GoogleFonts.catamaran(
    textStyle: TextStyle(
        color: AppConstants.textThemeColor,
        fontSize: ResponseHelper.instance.fontSize + 8,
        fontWeight: FontWeight.w600),
  );

  static TextStyle menuTxtStyleSemiBold = GoogleFonts.catamaran(
      textStyle: TextStyle(
          fontSize: ResponseHelper.instance.fontSize + 2,
          color: AppConstants.textThemeColor,
          fontWeight: FontWeight.w600));

  static TextStyle regTxtStyleSemiBold = GoogleFonts.catamaran(
      textStyle: TextStyle(
          fontSize: ResponseHelper.instance.fontSize,
          fontWeight: FontWeight.w600));

  static TextStyle semiBoldTxtStyle = TextStyle(
      fontSize: ResponseHelper.instance.fontSize - 2,
      fontWeight: FontWeight.w600);

  static TextStyle regboldTxtStyle = GoogleFonts.catamaran(
      textStyle: TextStyle(
          fontSize: ResponseHelper.instance.fontSize,
          fontWeight: FontWeight.w600));

  static TextStyle extraLightTxtStyle = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: ResponseHelper.instance.fontSize,
  ));
}
