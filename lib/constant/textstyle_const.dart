import 'package:flutter/material.dart';

import 'color_const.dart';

class MyTextStyles {

  //bold textStyle

  static TextStyle bold16({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: color ?? white,
    );
  }

  static TextStyle bold15({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
      color: color ?? white,
    );
  }

  static TextStyle bold14({Color? color, double? fontSize}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 14,
      color: color ?? white,
    );
  }

  static TextStyle bold13({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      color: color ?? white,
    );
  }

  static TextStyle bold12({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: color ?? white,
    );
  }

  static TextStyle bold11({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 11,
      color: color ?? white,
    );
  }

  //semiBold textStyle

  static TextStyle semiBold15({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      letterSpacing: 0.3,
      color: color ?? white,
    );
  }

  static TextStyle semiBold14({Color? color, double? fontSize}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize ?? 14,
      letterSpacing: 0.5,
      color: color ?? white,
    );
  }

  static TextStyle semiBold13({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: color ?? white,
    );
  }

  static TextStyle semiBold12({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: color ?? white,
    );
  }

  static TextStyle semiBold11({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: color ?? white,
    );
  }

  //medium textStyle

  static TextStyle medium15(
      {Color? color, double? fontSize, double? letterSpacing}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 15,
      height: 1.5,
      letterSpacing: letterSpacing ?? 0.4,
      color: color ?? white,
    );
  }

  static TextStyle medium14(
      {Color? color, double? fontSize, double? letterSpacing}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 14,
      height: 1.5,
      letterSpacing: letterSpacing ?? 0.4,
      color: color ?? white,
    );
  }


  static TextStyle medium13({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13,
      letterSpacing: 0.3,
      color: color ?? white,
    );
  }

  static TextStyle medium12({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: color ?? white,
    );
  }

  static TextStyle medium11({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      color: color ?? white,
    );
  }

  //regular textStyle

  static TextStyle regular15({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: color ?? white,
    );
  }

  static TextStyle regular14({Color? color, double? fontSize}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 14,
      letterSpacing: 0.3,
      color: color ?? white,
    );
  }


  static TextStyle regular13({Color? color, double? fontSize}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 13,
      letterSpacing: 0.2,
      color: color ?? white,
    );
  }

  static TextStyle regular12({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: color ?? white,
    );
  }

  static TextStyle regular11({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: color ?? white,
    );
  }

}