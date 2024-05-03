// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spriver_flutter/core/theme/theme.dart';
import 'package:spriver_flutter/core/utils/screen_utils.dart';

enum AppButtonType { Elevated, Outlined, Text }

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final AppButtonType type;
  final AppColorVariant variant;
  final AppSizeVariant size;
  final bool processing;
  final IconData? icon;
  final bool iconTrails;
  final bool disabled;

  const AppButton({
    required this.label,
    this.onPressed,
    this.type = AppButtonType.Elevated,
    this.variant = AppColorVariant.primary,
    this.size = AppSizeVariant.md,
    this.processing = false,
    this.icon,
    this.iconTrails = false,
    this.disabled = false,
    super.key,
  });

  ButtonStyle _styleElevated(BuildContext context) {
    final isMobile = ScreenUtils.size(context) == ScreenSize.sm;
    switch (variant) {
      case AppColorVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled || processing ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.primaryButtonBg,
          foregroundColor: Theme.of(context).colorScheme.primaryButtonFg,
          textStyle: TextStyle(
            fontSize: size == AppSizeVariant.lg && !isMobile ? 17 : null,
            fontWeight: size == AppSizeVariant.lg && !isMobile ? FontWeight.w500 : null,
          ),
        );

      case AppColorVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled || processing ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.secondaryButtonBg,
          foregroundColor: Theme.of(context).colorScheme.secondaryButtonFg,
        );
      case AppColorVariant.info:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled || processing ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.infoButtonBg,
          foregroundColor: Theme.of(context).colorScheme.infoButtonFg,
        );
      case AppColorVariant.danger:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled || processing ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.dangerButtonBg,
          foregroundColor: Theme.of(context).colorScheme.dangerButtonFg,
        );
      case AppColorVariant.success:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled || processing ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.successButtonBg,
          foregroundColor: Theme.of(context).colorScheme.successButtonFg,
        );
      case AppColorVariant.warning:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled || processing ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.warningButtonBg,
          foregroundColor: Theme.of(context).colorScheme.warningButtonFg,
        );
      case AppColorVariant.light:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.lightButtonBg,
          foregroundColor: Theme.of(context).colorScheme.lightButtonFg,
        );
      case AppColorVariant.dark:
        return ElevatedButton.styleFrom(
          backgroundColor: disabled || processing ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.lightButtonBg,
          foregroundColor: Theme.of(context).colorScheme.lightButtonFg,
        );
    }
  }

  ButtonStyle _styleOutlined(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (variant) {
      case AppColorVariant.primary:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primaryButtonBg,
        );
      case AppColorVariant.secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.secondaryButtonBg,
        );
      case AppColorVariant.info:
        return OutlinedButton.styleFrom(
          backgroundColor: colorScheme.infoButtonBg,
        );
      case AppColorVariant.danger:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.dangerButtonBg,
        );
      case AppColorVariant.success:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.successButtonBg,
        );
      case AppColorVariant.warning:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.warningButtonBg,
        );
      case AppColorVariant.light:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.lightButtonBg,
        );
      case AppColorVariant.dark:
        return OutlinedButton.styleFrom(
          foregroundColor: colorScheme.darkButtonBg,
        );
    }
  }

  ButtonStyle _styleText(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.primary:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.primaryButtonBg,
        );
      case AppColorVariant.secondary:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.secondaryButtonBg,
        );
      case AppColorVariant.info:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.infoButtonBg,
        );
      case AppColorVariant.danger:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.dangerButtonBg,
        );
      case AppColorVariant.success:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.successButtonBg,
        );
      case AppColorVariant.warning:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.warningButtonBg,
        );
      case AppColorVariant.light:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.lightButtonBg,
        );
      case AppColorVariant.dark:
        return OutlinedButton.styleFrom(
          foregroundColor: disabled || processing ? Theme.of(context).disabledColor : colorScheme.darkButtonBg,
        );
    }
  }

  Color? _iconColor(context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (onPressed == null || disabled) {
      return Theme.of(context).disabledColor;
    }

    switch (type) {
      case AppButtonType.Elevated:
        switch (variant) {
          case AppColorVariant.primary:
            return colorScheme.primaryButtonFg;
          case AppColorVariant.secondary:
            return colorScheme.secondaryButtonFg;
          case AppColorVariant.info:
            return colorScheme.infoButtonFg;
          case AppColorVariant.danger:
            return colorScheme.dangerButtonFg;
          case AppColorVariant.success:
            return colorScheme.successButtonFg;
          case AppColorVariant.warning:
            return colorScheme.warningButtonFg;
          case AppColorVariant.light:
            return colorScheme.lightButtonFg;
          case AppColorVariant.dark:
            return colorScheme.darkButtonFg;
        }
      case AppButtonType.Text:
      case AppButtonType.Outlined:
        switch (variant) {
          case AppColorVariant.primary:
            return colorScheme.primaryButtonBg;
          case AppColorVariant.secondary:
            return colorScheme.secondaryButtonBg;
          case AppColorVariant.info:
            return colorScheme.infoButtonBg;
          case AppColorVariant.danger:
            return colorScheme.dangerButtonBg;
          case AppColorVariant.success:
            return colorScheme.successButtonBg;
          case AppColorVariant.warning:
            return colorScheme.warningButtonBg;
          case AppColorVariant.light:
            return colorScheme.lightButtonBg;
          case AppColorVariant.dark:
            return colorScheme.darkButtonBg;
        }
    }
  }

  Widget _child(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Builder(
          builder: (context) {
            if (icon != null) {
              return Wrap(
                textDirection: iconTrails ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  Icon(
                    icon,
                    size: 16,
                    color: _iconColor(context),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    label,
                  ),
                ],
              );
            }

            return Text(label);
          },
        ),
        if (processing)
          const SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white38,
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = "$variant:$type:$size:$processing:$icon:$iconTrails:$disabled";
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Builder(
          builder: (context) {
            switch (type) {
              case AppButtonType.Elevated:
                return ElevatedButton(
                  key: Key('elevated:$key'),
                  onPressed: processing || disabled ? () {} : onPressed,
                  style: _styleElevated(context),
                  child: _child(context),
                );
              case AppButtonType.Outlined:
                return OutlinedButton(
                  key: Key('outlined:$key'),
                  onPressed: processing || disabled ? () {} : onPressed,
                  style: _styleOutlined(context),
                  child: _child(context),
                );
              case AppButtonType.Text:
                return TextButton(
                  key: Key('text:$key'),
                  onPressed: processing || disabled ? () {} : onPressed,
                  style: _styleText(context),
                  child: _child(context),
                );
            }
          },
        ),
      ],
    );
  }
}
