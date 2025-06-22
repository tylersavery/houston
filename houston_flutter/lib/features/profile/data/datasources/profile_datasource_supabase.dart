import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/profile_datasource.dart';
import '../../domain/models/profile_model.dart';

class ProfileDataSourceSupabaseImpl implements ProfileDataSource {
  final SupabaseClient client;

  const ProfileDataSourceSupabaseImpl(this.client);

  static String defaultSelect = "*";

  @override
  Future<PaginatedResponse<Profile>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await client
          .from("profile")
          .select(defaultSelect)
          .range((page - 1) * limit, limit * page)
          .count(CountOption.exact);

      return PaginatedResponse<Profile>(
        results:
            result.data.map<Profile>((item) => Profile.fromJson(item)).toList(),
        status: 200,
        count: result.count,
        page: page,
        limit: limit,
        numPages: (result.count / limit).ceil(),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Profile> retrieve(int id) async {
    try {
      final result =
          await client
              .from("profile")
              .select(defaultSelect)
              .eq('id', id)
              .single();
      return Profile.fromJson(result);
    } catch (e) {
      throw const ServerException("Not Found");
    }
  }

  @override
  Future<Profile> save(Profile profile) async {
    try {
      if (profile.id == null) {
        final result =
            await client
                .from("profile")
                .insert(profile.toJson())
                .select(defaultSelect)
                .single();
        return Profile.fromJson(result);
      } else {
        final result =
            await client
                .from("profile")
                .update(profile.toJson())
                .match({"id": profile.id})
                .select(defaultSelect)
                .single();
        return Profile.fromJson(result);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.from("profile").delete().match({"id": id});
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
