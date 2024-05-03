import 'package:flutter/material.dart';
import 'empty_placeholder.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteListWidget<T> extends StatelessWidget {
  final PagingController<int, T> pagingController;
  final bool isCarousel;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Function onRefresh;
  final String emptyText;
  final bool shrinkWrap;
  final Widget? emptyWidget;
  final ScrollController? scrollController;

  const InfiniteListWidget({
    required this.pagingController,
    required this.itemBuilder,
    required this.emptyText,
    required this.onRefresh,
    this.isCarousel = false,
    this.shrinkWrap = false,
    this.emptyWidget,
    this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      color: Colors.white,
      onRefresh: () => Future.sync(() => onRefresh()),
      child: PagedListView<int, T>(
        scrollController: scrollController,
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.zero,
        scrollDirection: isCarousel ? Axis.horizontal : Axis.vertical,
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: itemBuilder,
          noItemsFoundIndicatorBuilder: (_) => emptyWidget != null ? emptyWidget! : EmptyPlaceholder(title: emptyText),
        ),
      ),
    );
  }
}
