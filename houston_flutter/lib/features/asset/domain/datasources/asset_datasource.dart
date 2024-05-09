import 'package:image_picker/image_picker.dart';

abstract interface class AssetDataSource {
  Future<String> uploadImage(XFile image);
}
