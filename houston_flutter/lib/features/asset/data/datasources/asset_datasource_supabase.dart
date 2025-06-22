import 'package:houston_flutter/config/env.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/utils/string_utils.dart';
import 'package:houston_flutter/features/asset/domain/datasources/asset_datasource.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AssetDataSourceSupabaseImpl implements AssetDataSource {
  final SupabaseClient client;
  const AssetDataSourceSupabaseImpl(this.client);

  @override
  Future<String> uploadImage(XFile image) async {
    final user = client.auth.currentUser;

    if (user == null) {
      throw const ServerException("User is not authenticated.");
    }

    final path = "${user.id}/${generateRandomString(8)}/${image.name}";

    final avatarFile = await image.readAsBytes();
    final result = await client.storage
        .from(Env.supabaseBucketName)
        .uploadBinary(
          path,
          avatarFile,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    return "https://${Env.supabaseProject}.supabase.co/storage/v1/object/public/$result";
  }
}
