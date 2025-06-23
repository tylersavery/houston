import 'dart:collection';
import 'dart:typed_data';

import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/core/utils/dialog_utils.dart';
import 'package:houston_flutter/core/widgets/base_component.dart';
import 'package:houston_flutter/features/asset/domain/providers/asset_repository_provider.dart';

import 'package:image_picker/image_picker.dart';
import "dart:ui" as ui;
import 'package:image/image.dart' as IMG;
import 'package:url_launcher/url_launcher_string.dart';

class ImageUploadWidget extends BaseComponent {
  final Function(String) onChange;
  final Function() onRemove;
  final Function()? onLoadingStart;
  final Function()? onLoadingComplete;
  final String? currentUrl;
  final String title;
  final String? subtitle;
  final int? targetWidth;
  final int? targetHeight;
  final List<(int, int)>? multipleSizes;
  final Function(Map<String, String>)? onMultipleSizesChange;

  const ImageUploadWidget({
    super.key,
    required this.onRemove,
    required this.onChange,
    required this.title,
    required this.currentUrl,
    this.subtitle,
    this.targetWidth,
    this.targetHeight,
    this.multipleSizes,
    this.onMultipleSizesChange,
    this.onLoadingStart,
    this.onLoadingComplete,
  });

  Future<String?> _cropImage(
    BuildContext context,
    WidgetRef ref, {
    required int width,
    required int height,
    required Uint8List bytes,
    required String filename,
    required String contentType,
    List<int> multipleWidths = const [],
  }) async {
    final cropAspectRatio = width / height;

    final controller = CropController(aspectRatio: cropAspectRatio);

    if (context.mounted) {
      final String? croppedUrl = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Crop Image (${width}x$height)"),
            content: SizedBox(
              width: 500,
              height: 500,
              child: CropImage(
                controller: controller,
                image: Image.memory(bytes),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  _startLoading();
                  await Future.delayed(const Duration(milliseconds: 200));
                  final bitmap = await controller.croppedBitmap();

                  final byteData = await bitmap.toByteData(
                    format: ui.ImageByteFormat.png,
                  );

                  if (byteData == null) {
                    return;
                  }

                  int length = byteData.lengthInBytes;

                  Uint8List croppedBytes = Uint8List.view(
                    byteData.buffer
                        .asUint8List(byteData.offsetInBytes, length)
                        .buffer,
                  );

                  if (context.mounted) {
                    if (multipleWidths.isNotEmpty) {
                      final List<String> urls = [];
                      for (final width in multipleWidths) {
                        final url = await _resize(
                          context,
                          ref,
                          bytes: croppedBytes,
                          width: width,
                          contentType: contentType,
                          filename: filename,
                        );
                        if (url != null) {
                          urls.add(url);
                        }
                      }
                      _completeLoading();
                      if (context.mounted) {
                        Navigator.of(context).pop(urls.join("||"));
                      }
                    } else {
                      try {
                        final url = await _resize(
                          context,
                          ref,
                          bytes: croppedBytes,
                          width: width,
                          contentType: contentType,
                          filename: filename,
                        );
                        _completeLoading();

                        if (context.mounted) {
                          Navigator.of(context).pop(url);
                        }
                      } catch (e) {
                        print(e);
                        _completeLoading();
                      }
                    }
                  }
                },
                child: const Text("Crop!"),
              ),
            ],
          );
        },
      );

      return croppedUrl;
    }

    return null;
  }

  Future<void> _handleUpload(BuildContext context, WidgetRef ref) async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      final ext = pickedImage.name.split('.').last.toLowerCase();

      late final String contentType;
      switch (ext) {
        case "png":
          contentType = "image/png";
          break;
        case "gif":
          contentType = "image/gif";
          break;
        case "webp":
          contentType = "image/webp";
          break;
        default:
          contentType = "image/jpeg";
      }

      final filename = pickedImage.name;

      final bytes = await pickedImage.readAsBytes();

      final cropAspectRatio =
          targetWidth != null && targetHeight != null
              ? targetWidth! / targetHeight!
              : null;

      if (cropAspectRatio == null) {
        _startLoading();

        final result = await ref
            .read(assetRepositoryProvider)
            .upload(contentType: contentType, filename: filename, bytes: bytes);

        result.fold(
          (failure) {
            print(failure);
            _completeLoading();
          },
          (url) {
            onChange(url);
            _completeLoading();
          },
        );
      } else {
        if (context.mounted) {
          if (onMultipleSizesChange != null &&
              multipleSizes != null &&
              multipleSizes!.isNotEmpty) {
            final Map<String, String> outputMap = {};

            // for (final size in multipleSizes!) {
            //   final key = "${size.$1}x${size.$2}";
            //   outputMap[key] = ;
            // }

            // final List<String> allUrls = [];

            Map<double, List<(int, int)>> groupedAspectRatios =
                _groupByAspectRatio(multipleSizes!);

            for (final entry in groupedAspectRatios.entries) {
              final ratio = entry.key;
              final sizes = entry.value;

              final croppedUrlsString = await _cropImage(
                context,
                ref,
                width: sizes.first.$1,
                height: (sizes.first.$1 * ratio).round(),
                filename: filename,
                contentType: contentType,
                bytes: bytes,
                multipleWidths: sizes.map((item) => item.$1).toList(),
              );

              if (croppedUrlsString != null) {
                final urls = croppedUrlsString.split("||");
                int index = 0;
                for (final size in sizes) {
                  outputMap["${size.$1}x${size.$2}"] = urls[index];
                  index++;
                }
              }
            }

            //

            //

            if (outputMap.isNotEmpty) {
              onMultipleSizesChange!(outputMap);
            }
          } else {
            final croppedUrl = await _cropImage(
              context,
              ref,
              width: targetWidth!,
              height: targetHeight!,
              filename: filename,
              contentType: contentType,
              bytes: bytes,
            );

            if (croppedUrl != null) {
              onChange(croppedUrl);
            }
          }
        }
      }
    }
  }

  Future<String?> _resize(
    BuildContext context,
    WidgetRef ref, {
    required Uint8List bytes,
    required int width,
    required String contentType,
    required String filename,
  }) async {
    final decodededImage = IMG.decodeImage(bytes);
    if (decodededImage == null) {
      return null;
    }

    final resizedImage = IMG.copyResize(
      decodededImage,
      width: width,
      interpolation: IMG.Interpolation.cubic,
    );

    late final Uint8List resizedImageBytes;

    switch (contentType) {
      case "image/png":
      case "image/webp":
        resizedImageBytes = Uint8List.fromList(IMG.encodePng(resizedImage));
        break;
      case "image/gif":
        resizedImageBytes = Uint8List.fromList(IMG.encodeGif(resizedImage));
        break;

      default:
        resizedImageBytes = Uint8List.fromList(IMG.encodeJpg(resizedImage));
    }

    final result = await ref
        .read(assetRepositoryProvider)
        .upload(
          contentType: contentType,
          filename: filename,
          bytes: resizedImageBytes,
        );
    return result.fold(
      (failure) {
        print(failure);
        return null;
      },
      (url) {
        return url;
      },
    );
  }

  void _startLoading() {
    if (onLoadingStart != null) {
      onLoadingStart!();
    }
  }

  void _completeLoading() {
    if (onLoadingComplete != null) {
      onLoadingComplete!();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasImage = currentUrl != null && currentUrl!.isNotEmpty;

    return Card(
      child: ListTile(
        title: Text(title),
        onTap: () {
          _handleUpload(context, ref);
        },
        subtitle: subtitle != null ? Text(subtitle!) : null,
        leading:
            hasImage
                ? InkWell(
                  onTap: () {
                    launchUrlString(currentUrl!);
                  },
                  child: Image.network(
                    currentUrl!,
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                )
                : const Icon(Icons.image_not_supported),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                _handleUpload(context, ref);
              },
              icon: const Icon(Icons.upload),
            ),
            if (hasImage)
              IconButton(
                onPressed: () async {
                  final confirmed = await ConfirmDialog.show(
                    title: "Remove Image",
                    body: "Are you sure you want to remove this image?",
                    destructive: true,
                    confirmText: "Remove",
                  );
                  if (confirmed != true) {
                    return;
                  }

                  onRemove();
                },
                icon: const Icon(Icons.delete_forever),
              ),
          ],
        ),
      ),
    );
  }

  Map<double, List<(int, int)>> _groupByAspectRatio(
    List<(int, int)> multipleSizes,
  ) {
    Map<double, List<(int, int)>> map = HashMap();

    for (var combo in multipleSizes) {
      double ratio = combo.$1 / combo.$2;
      if (!map.containsKey(ratio)) {
        map[ratio] = [];
      }
      map[ratio]!.add(combo);
    }

    return map;
  }
}
