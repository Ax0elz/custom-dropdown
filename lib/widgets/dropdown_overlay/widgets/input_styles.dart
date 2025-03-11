import 'package:flutter/material.dart';

InputDecoration mainInputDecorationDisabled({
  String? hint,
  String? prefixText,
  String? suffixText,
  Widget? suffixIcon,
  Color? bgColor,
  required BuildContext context,
  required BorderRadius borderRadius,
}) {
  return InputDecoration(
    isDense: true,
    hintStyle:
        TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.outline),
    hintText: hint,
    prefixText: prefixText,
    suffixText: suffixText,
    suffixIcon: suffixIcon,
    suffixIconConstraints: BoxConstraints.tight(
      const Size(28 + 8, 28),
    ),
    prefixIconConstraints: BoxConstraints.tight(
      const Size(28 + 8, 28),
    ),
    prefixStyle: Theme.of(context).textTheme.labelLarge,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: borderRadius,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.surface, width: 1),
      borderRadius: borderRadius,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: borderRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.surface, width: 2),
      borderRadius: borderRadius,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: borderRadius,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: borderRadius,
    ),
    errorStyle: Theme.of(context).textTheme.labelMedium,
    filled: true,
    fillColor: bgColor ?? Theme.of(context).colorScheme.surface,
    // counterText: ' ',
    // counterStyle: const TextStyle(height: 0, fontSize: 0, color: Colors.transparent),
    contentPadding:
        const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
  );
}

InputDecoration mainInputDecorationEnabled({
  String? hint,
  String? prefixText,
  String? suffixText,
  Widget? suffixIcon,
  Color? bgColor,
  String? errorText,
  required BuildContext context,
  required BorderRadius borderRadius,
}) {
  return InputDecoration(
    hintStyle:
        TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.secondary),
    hintText: hint,
    prefixText: prefixText,
    suffixText: suffixText,
    isDense: true,
    suffixIcon: suffixIcon,
    suffixIconConstraints: BoxConstraints.tight(
      const Size(28 + 8, 28),
    ),
    prefixIconConstraints: BoxConstraints.tight(
      const Size(28 + 8, 28),
    ),
    prefixStyle: Theme.of(context).textTheme.labelLarge,
    hoverColor: Theme.of(context).colorScheme.outline.withValues(alpha: .4),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: borderRadius,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.outline, width: 1),
      borderRadius: borderRadius,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: borderRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: .4),
        width: 1,
      ),
      borderRadius: borderRadius,
    ),
    errorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.error, width: .6),
      borderRadius: borderRadius,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.error, width: .6),
      borderRadius: borderRadius,
    ),
    errorText: errorText,
    errorStyle:
        const TextStyle(height: 0, fontSize: 0, color: Colors.transparent),
    filled: true,
    fillColor: bgColor ??
        Theme.of(context).colorScheme.outline.withValues(
              alpha: Theme.of(context).brightness == Brightness.light ? .4 : .1,
            ),
    // counterText: ' ',
    // counterStyle: const TextStyle(height: 0, fontSize: 0, color: Colors.transparent),

    contentPadding:
        const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
  );
}
