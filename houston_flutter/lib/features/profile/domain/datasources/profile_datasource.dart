import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/profile_model.dart';

abstract interface class ProfileDataSource {
  Future<PaginatedResponse<Profile>> list({required int page, required int limit});
  Future<Profile> retrieve(int id);
  Future<Profile> save(Profile profile);
  Future<void> delete(int id);
}