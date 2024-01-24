import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:par_interview/constant/textstyle_const.dart';

import '../constant/color_const.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String)? onChanged;
  final bool autoFocus;
  final String? hintText;
  final String? prefixText;
  final String? label;
  final String? initVal;
  final String? autoVal;
  final TextInputType? keyboardType;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool showEye;
  final TextStyle? textStyle;
  final TextCapitalization? textCapitalization;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool isPassword;
  final bool readOnly;
  final bool isEnable;
  final bool isSearchField;
  final Widget? pWidget;
  final Widget? sWidget;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final double? maxHeight;
  final double? bottomPadding;
  final double? fImageSize;
  final double? topPadding;
  final double? radius;
  final double? height;
  final Color? imageColor;
  final Color? fillColor;
  final BoxConstraints? suffixIconConstraints;
  final AutovalidateMode? autoValidateMode;
  final BoxConstraints? prefixIconConstraints;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.prefixText,
    this.keyboardType,
    this.initVal,
    this.label,
    this.fImageSize,
    this.textStyle,
    this.height,
    this.autoVal,
    this.maxLength,
    this.fillColor,
    this.focusNode,
    this.showEye = false,
    this.isSearchField = false,
    this.textCapitalization,
    this.validator,
    this.imageColor,
    this.onFieldSubmitted,
    this.controller,
    this.textInputAction,
    this.isPassword = false,
    this.readOnly = false,
    this.maxLines,
    this.minLines,
    this.suffixIconConstraints,
    this.inputFormatters,
    this.isEnable = true,
    this.maxHeight,
    this.bottomPadding,
    this.topPadding,
    this.radius,
    this.pWidget,
    this.sWidget,
    this.autoFocus = false,
    this.autoValidateMode,
    this.prefixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: bottomPadding ?? 20.0, top: topPadding ?? 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "$label",
                style: textStyle ?? MyTextStyles.regular13(color: white),
              ),
            ),
          SizedBox(
            height: height ?? 50,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              onChanged: onChanged,
              autofillHints: autoVal != null ? [autoVal!] : [],
              initialValue: initVal,
              cursorColor: white,
              autofocus: autoFocus,
              enabled: isEnable,
              readOnly: readOnly,
              controller: controller,
              textCapitalization:
                  textCapitalization ?? TextCapitalization.sentences,
              keyboardType: keyboardType,
              style: MyTextStyles.medium14(color: white),
              maxLength: maxLength,
              maxLines: maxLines ?? 1,
              minLines: minLines,
              focusNode: focusNode,
              validator: validator,
              textInputAction: textInputAction,
              obscureText: isPassword,
              inputFormatters: inputFormatters,
              onFieldSubmitted: onFieldSubmitted,
              cursorWidth: 1.5,
              autovalidateMode: autoValidateMode,
              decoration: InputDecoration(
                constraints: const BoxConstraints(maxHeight: 50),
                counterText: "",
                fillColor: fillColor ?? lightBlack,
                filled: true,
                isDense: true,
                hintText: hintText ?? "",
                alignLabelWithHint: true,
                hintStyle:
                    MyTextStyles.regular13(color: grey500, fontSize: 13.5),
                errorStyle: MyTextStyles.regular13(color: redAccent),
                suffixIconConstraints: suffixIconConstraints,
                contentPadding: EdgeInsets.only(
                    top: 13.7,
                    bottom: isSearchField == true ? 10 : 13.7,
                    left: 12,
                    right: 12),
                prefixStyle: MyTextStyles.regular13(color: grey500),
                prefixIconConstraints: prefixIconConstraints,
                prefixIcon: pWidget != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 9),
                        child: pWidget)
                    : null,
                suffixIcon: sWidget != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: sWidget,
                      )
                    : null,
                errorMaxLines: 2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 6),
                  borderSide: const BorderSide(width: 0.35, color: grey500),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 6),
                  borderSide: const BorderSide(width: 0.35, color: grey500),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 6),
                  borderSide: const BorderSide(width: 0.35, color: white),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 6),
                  borderSide: const BorderSide(width: 0.35, color: grey500),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 6),
                  borderSide: const BorderSide(width: 0.35, color: redAccent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 6),
                  borderSide: const BorderSide(
                    width: 0.35,
                    color: redAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
