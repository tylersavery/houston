import 'package:flutter/material.dart';

class ForeignKeySelector<T> extends StatelessWidget {
  final List<T> options;
  final int Function(T) valueBuilder;
  final String Function(T) labelBuilder;
  final Function(int?) onChanged;

  const ForeignKeySelector({
    required this.options,
    required this.valueBuilder,
    required this.labelBuilder,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final opts =
        options
            .map(
              (o) => DropdownMenuItem(
                value: valueBuilder(o),
                child: Text(labelBuilder(o)),
              ),
            )
            .toList();

    return DropdownButton<int>(items: opts, onChanged: onChanged);
  }
}
