import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app.dart';
import '../theme/buttons.dart';
import '../theme/theme.dart';

class InfoDialog {
  static Future<bool?> show({
    required String title,
    String? body,
    Widget? content,
    String? closeText,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            AppButton(
              label: closeText ?? "Close",
              onPressed: () {
                Navigator.of(context).pop();
              },
              variant: AppColorVariant.primary,
              type: AppButtonType.Elevated,
            ),
          ],
        );
      },
    );
  }
}

class ConfirmDialog {
  static Future<bool?> show({
    required String title,
    Widget? content,
    String? body,
    String? cancelText,
    String? confirmText,
    bool destructive = false,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            AppButton(
              label: cancelText ?? "Cancel",
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              variant: AppColorVariant.light,
              type: AppButtonType.Text,
            ),
            AppButton(
              label: confirmText ?? "Yes",
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              variant:
                  destructive
                      ? AppColorVariant.danger
                      : AppColorVariant.primary,
              type: AppButtonType.Elevated,
            ),
          ],
        );
      },
    );
  }
}

class PromptDialog {
  static Future<String?> show({
    required String title,
    String? Function(String?)? validator,
    required String labelText,
    bool obscureText = false,
    String? cancelText,
    String? confirmText,
    String initialValue = "",
    bool destructive = false,
    bool readOnly = false,
    bool withCopy = false,
    bool multiline = false,
    Function(String)? onValidSubmission,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    final GlobalKey<FormState> formKey = GlobalKey();

    final TextEditingController controller = TextEditingController(
      text: initialValue,
    );

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          title: Text(title),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  autofocus: true,
                  readOnly: readOnly,
                  minLines: multiline ? 3 : 1,
                  maxLines: multiline ? 3 : 1,
                  decoration: InputDecoration(
                    label: Text(
                      labelText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                  validator: validator,
                ),
                if (withCopy)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: AppButton(
                      label: "Copy",
                      icon: Icons.copy,
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: initialValue),
                        );
                      },
                      type: AppButtonType.Text,
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            AppButton(
              label: cancelText ?? "Cancel",
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              variant: AppColorVariant.light,
              type: AppButtonType.Text,
            ),
            AppButton(
              label: confirmText ?? "Submit",
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                final value = controller.value.text;

                if (onValidSubmission != null) {
                  onValidSubmission(value);
                  return;
                }

                Navigator.of(context).pop(value.isNotEmpty ? value : null);
              },
              variant:
                  destructive
                      ? AppColorVariant.danger
                      : AppColorVariant.primary,
              type: AppButtonType.Elevated,
            ),
          ],
        );
      },
    );
  }
}
