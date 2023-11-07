part of '../../custom_dropdown.dart';

class _ItemsList<T> extends StatelessWidget {
  final ScrollController scrollController;
  final T? selectedItem;
  final List<T> items;
  final Function(T) onItemSelect;
  final bool excludeSelected;
  final EdgeInsets padding;
  // ignore: library_private_types_in_public_api
  final _ListItemBuilder<T> listItemBuilder;

  const _ItemsList({
    super.key,
    required this.scrollController,
    required this.selectedItem,
    required this.items,
    required this.onItemSelect,
    required this.excludeSelected,
    required this.padding,
    required this.listItemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        padding: padding,
        itemCount: items.length,
        itemBuilder: (_, index) {
          final selected = !excludeSelected && selectedItem == items[index];
          return Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4),
            child: Material(
              borderRadius: _defaultBorderRadius,
              color: Colors.transparent,
              child: InkWell(
                borderRadius: _defaultBorderRadius,
                splashColor: Colors.transparent,
                highlightColor: Theme.of(context).colorScheme.outline,
                onTap: () => onItemSelect(items[index]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: _defaultBorderRadius,
                    color: selected
                        ? Theme.of(context).colorScheme.secondary.withOpacity(.1)
                        : Colors.transparent,
                  ),
                  padding: _listItemPadding,
                  child: listItemBuilder(context, items[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
