import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../../../core/error/exceptions.dart';
import '../mappers/profile_mapper.dart';
import '../../domain/datasources/profile_datasource.dart';
import '../../domain/models/profile_model.dart';

class ProfileDataSourceServerpodImpl implements ProfileDataSource {
  final Client client;

  const ProfileDataSourceServerpodImpl(this.client);

  @override
  Future<PaginatedResponse<Profile>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await client.profile.list(
        page: page,
        limit: limit,
        orderBy: 'id',
      );
      return PaginatedResponse<Profile>(
        status: 200,
        page: response.page,
        count: response.count,
        numPages: response.numPages,
        limit: response.limit,
        results: ProfileMapper.listToModel(response.results),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Profile> retrieve(int id) async {
    try {
      final result = await client.profile.retrieve(id);
      if (result == null) {
        throw const ServerException("Not Found");
      }
      return ProfileMapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Profile> save(Profile profile) async {
    try {
      final result = await client.profile.save(ProfileMapper.toDto(profile));
      return ProfileMapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.profile.delete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
