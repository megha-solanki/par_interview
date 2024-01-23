import 'package:flutter/material.dart';
import 'package:par_interview/constant/textstyle_const.dart';

import '../constant/color_const.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? label;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? iconColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final double? fontSize;
  final double? borderWidth;
  final double? iconSize;
  final Widget? fImage;
  final Widget? bImage;

  const CustomButton({
    this.label,
    this.onPressed,
    this.fontSize,
    this.iconSize,
    this.textStyle,
    this.fontColor,
    this.iconColor,
    this.isLoading = false,
    this.borderRadius,
    this.fImage,
    this.borderWidth,
    this.bImage,
    this.borderColor,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0,0.3,0.7,1.0],
        colors: [
         Colors.redAccent,
         Colors.redAccent.shade100,
          Colors.purple.shade400,
          Colors.purple,

        ],
      ),
        borderRadius: BorderRadius.circular(borderRadius??6),
      ),
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
              side: BorderSide(
                  color: borderColor ?? grey100, width: borderWidth ?? 0.25),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? transparent,
          ),
        ),
        onPressed: /* isLoading ? null :*/ onPressed,
        child: /*isLoading
            ? const CustomLoadingIndicator(
                size: 19,
                color: Colors.white,
              )
            :*/
            Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (fImage != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: fImage
              ),
            if (label != null)
              Center(
                child: label
              ),
            if (bImage != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child:bImage
              ),
          ],
        ),
      ),
    );
  }
}
