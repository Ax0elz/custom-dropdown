// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:animated_custom_dropdown/widgets/dropdown_overlay/widgets/input_styles.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextBox extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyTextBox({
    required this.controller,
    this.textInputType,
    this.hint,
    this.onSubmit,
    this.onChange,
    this.bgColor,
    this.suffixIcon,
    this.obscureText = false,
    this.characterLimit,
    this.autofillHints,
    this.textBoxTitle,
    this.focusNode,
    this.enabled = true,
    this.minLines,
    this.maxLines,
    this.inputFormatters,
    this.textCapitalization,
    this.validator,
    this.autoValidate,
    this.prefixText,
    this.suffixText,
    this.centerText = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.errorText,
    this.onTap,
    this.height,
    this.textActionType,
    this.borderRadius,
  });

  final TextEditingController controller;
  final TextInputType? textInputType;
  final String? hint;
  final void Function(String?)? onSubmit;
  final void Function(String)? onChange;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? characterLimit;
  final FocusNode? focusNode;
  final bool enabled;
  final int? minLines;
  final int? maxLines;
  final autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final String? suffixText;
  final String? textBoxTitle;
  final Color? bgColor;
  final AutovalidateMode? autoValidate;
  final bool centerText;
  final bool readOnly;
  final String? errorText;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool autoFocus;
  final double? height;
  final TextInputAction? textActionType;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRad = borderRadius ??
        const SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: 8, cornerSmoothing: .8),
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textBoxTitle != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(
              textBoxTitle!,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const SizedBox(height: 5),
        ],
        SizedBox(
          height: height,
          child: TextFormField(
            textInputAction: textActionType,
            minLines: minLines,
            maxLines: maxLines ?? 1,
            enabled: enabled,
            readOnly: readOnly,
            autofillHints: [if (autofillHints != null) ...autofillHints],
            controller: controller,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            focusNode: focusNode,
            style: Theme.of(context).textTheme.bodyMedium,
            validator: validator ??
                (String? val) {
                  return null;
                },
            onTap: onTap ?? () {},
            autofocus: autoFocus,
            autovalidateMode: autoValidate ?? AutovalidateMode.disabled,
            textAlign: centerText ? TextAlign.center : TextAlign.start,
            inputFormatters: [
              LengthLimitingTextInputFormatter(characterLimit ?? 144),
              if (inputFormatters != null) ...inputFormatters!,
            ],
            cursorHeight: 16,
            decoration: enabled
                ? mainInputDecorationEnabled(
                    context: context,
                    suffixIcon: suffixIcon,
                    suffixText: suffixText,
                    prefixText: prefixText,
                    bgColor: bgColor,
                    hint: hint,
                    errorText: errorText,
                    borderRadius: borderRad,
                  )
                : mainInputDecorationDisabled(
                    context: context,
                    suffixIcon: suffixIcon,
                    suffixText: suffixText,
                    prefixText: prefixText,
                    bgColor: bgColor,
                    hint: hint,
                    borderRadius: borderRad,
                  ),
            keyboardType: textInputType,
            obscureText: obscureText,
            onFieldSubmitted: onSubmit,
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
