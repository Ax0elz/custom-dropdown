part of 'custom_dropdown.dart';

Icon _textFieldIcon(BuildContext context) => Icon(
      Icons.keyboard_arrow_down_rounded,
      color: Theme.of(context).colorScheme.onBackground,
      size: 20,
    );

class _DropDownField<T> extends StatefulWidget {
  final VoidCallback onTap;
  final ValueNotifier<T?> selectedItemNotifier;
  final String hintText;
  final Color? fillColor;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final String? errorText;
  final TextStyle? errorStyle;
  final BorderSide? errorBorderSide;
  final Widget? suffixIcon;
  final int maxlines;

  // ignore: library_private_types_in_public_api
  final _HeaderBuilder<T>? headerBuilder;
  // ignore: library_private_types_in_public_api
  final _HintBuilder? hintBuilder;

  const _DropDownField({
    super.key,
    required this.onTap,
    required this.selectedItemNotifier,
    required this.maxlines,
    this.hintText = 'Select value',
    this.fillColor,
    this.border,
    this.borderRadius,
    this.errorText,
    this.errorStyle,
    this.errorBorderSide,
    this.headerBuilder,
    this.hintBuilder,
    this.suffixIcon,
  });

  @override
  State<_DropDownField<T>> createState() => _DropDownFieldState<T>();
}

class _DropDownFieldState<T> extends State<_DropDownField<T>> {
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItemNotifier.value;
  }

  Widget _defaultHeaderBuilder(T result) {
    return Text(
      result.toString(),
      maxLines: widget.maxlines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _defaultHintBuilder(String hint) {
    return Text(
      hint,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  @override
  void didUpdateWidget(covariant _DropDownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedItem = widget.selectedItemNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: _headerPadding,
        decoration: BoxDecoration(
          color: widget.fillColor ?? Theme.of(context).colorScheme.background,
          border:
              widget.border ?? Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
          borderRadius: widget.borderRadius ?? _defaultBorderRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: selectedItem != null
                  ? widget.headerBuilder != null
                      ? widget.headerBuilder!(context, selectedItem as T)
                      : _defaultHeaderBuilder(selectedItem as T)
                  : widget.hintBuilder != null
                      ? widget.hintBuilder!(context, widget.hintText)
                      : _defaultHintBuilder(widget.hintText),
            ),
            const SizedBox(width: 12),
            widget.suffixIcon ?? _textFieldIcon(context),
          ],
        ),
      ),
    );
  }
}
