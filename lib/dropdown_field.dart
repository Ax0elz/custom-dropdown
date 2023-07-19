part of 'custom_dropdown.dart';

Icon _textFieldIcon(BuildContext context) => Icon(
      Icons.keyboard_arrow_down_rounded,
      color: Theme.of(context).colorScheme.onBackground,
      size: 20,
    );
const _contentPadding = EdgeInsets.only(left: 16);
const _noTextStyle = TextStyle(height: 0);
const _borderSide = BorderSide(color: Colors.transparent);
const _errorBorderSide = BorderSide(color: Colors.redAccent, width: 2);

class _DropDownField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final Function(String)? onChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? errorText;
  final TextStyle? errorStyle;
  final BorderSide? borderSide;
  final BorderSide? errorBorderSide;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final Color? fillColor;
  final InputDecoration? decoration;

  const _DropDownField({
    Key? key,
    required this.controller,
    required this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.style,
    this.errorText,
    this.errorStyle,
    this.borderSide,
    this.errorBorderSide,
    this.borderRadius,
    this.fillColor,
    this.decoration,
  }) : super(key: key);

  @override
  State<_DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<_DropDownField> {
  String? prevText;
  bool listenChanges = true;

  @override
  void initState() {
    super.initState();
    if (widget.onChanged != null) {
      widget.controller.addListener(listenItemChanges);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(listenItemChanges);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _DropDownField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onChanged != null) {
      widget.controller.addListener(listenItemChanges);
    } else {
      listenChanges = false;
    }
  }

  void listenItemChanges() {
    if (listenChanges) {
      final text = widget.controller.text;
      if (prevText != null && prevText != text && text.isNotEmpty) {
        widget.onChanged!(text);
      }
      prevText = text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: widget.borderRadius ??
          const SmoothBorderRadius.all(SmoothRadius(cornerRadius: 10, cornerSmoothing: .8)),
      borderSide: widget.borderSide ?? _borderSide,
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius ??
          const SmoothBorderRadius.all(SmoothRadius(cornerRadius: 10, cornerSmoothing: .8)),
      borderSide: widget.errorBorderSide ?? _errorBorderSide,
    );

    return TextFormField(
      controller: widget.controller,
      validator: (val) {
        if (val?.isEmpty ?? false) return widget.errorText ?? '';
        return null;
      },
      readOnly: true,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      style: widget.style,
      decoration: widget.decoration?.copyWith(suffixIcon: _textFieldIcon(context)) ??
          InputDecoration(
            isDense: true,
            contentPadding: _contentPadding,
            suffixIcon: widget.suffixIcon ?? _textFieldIcon(context),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            fillColor: widget.fillColor,
            filled: true,
            errorStyle: widget.errorText != null ? widget.errorStyle : _noTextStyle,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
          ),
    );
  }
}
