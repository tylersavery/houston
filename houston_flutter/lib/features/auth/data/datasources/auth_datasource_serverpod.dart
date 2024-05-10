import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:houston_flutter/features/profile/data/mappers/profile_mapper.dart';
import 'package:houston_flutter/features/profile/domain/models/profile_model.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:houston_client/houston_client.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/models/user_model.dart';

class AuthDataSourceServerpodImpl implements AuthDataSource {
  final Client client;
  final SessionManager sessionManager;

  AuthDataSourceServerpodImpl(this.client, this.sessionManager);

  // User _userWithProfile(String id, String email, Profile profile) {
  //   return User(
  //     id: id,
  //     email: email,
  //     username: profile.username,
  //     firstName: profile.firstName,
  //     lastName: profile.lastName,
  //     bio: profile.bio,
  //     avatar: profile.avatar,
  //   );
  // }

  //TODO: Serverpod Profile

  User _userWithProfile(String id, String email, String username, Profile profile) {
    return User(
      id: id,
      email: email,
      username: username,
      firstName: profile.firstName,
      lastName: profile.lastName,
      bio: profile.bio,
      avatar: profile.avatar,
    );
  }

  Future<Profile> _fetchProfile(int userId) async {
    try {
      final result = await client.profile.retrieveByUserId(userId);
      if (result != null) {
        return Profile(
          id: result.id,
          userId: result.userId,
          uid: result.uid,
          username: result.username,
          firstName: result.firstName,
          lastName: result.lastName,
          bio: result.bio,
          avatar: result.avatar,
          createdAt: result.createdAt,
        );
      }
      throw const ServerException("No Profile");
    } catch (e) {
      print(e);
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> currentUser() async {
    final user = sessionManager.signedInUser;

    if (user != null && user.id != null) {
      final profile = await _fetchProfile(user.id!);
      return _userWithProfile(user.id!.toString(), user.email!, user.userName, profile);
    }
    return null;
  }

  @override
  Future<bool> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final result = await client.modules.auth.email.createAccountRequest(username, email, password);

      if (result == false) {
        throw const ServerException();
      }

      return true;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> confirmRegistration({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final result = await client.modules.auth.email.createAccount(email, verificationCode);

      if (result == null) {
        throw const ServerException("UserInfo was null");
      }

      final profileDTO = await client.profile.createFromUser(result);
      final profile = ProfileMapper.toModel(profileDTO);

      print("PROFILE");
      print(profileDTO);
      print(profile);

      return _userWithProfile(result.id!.toString(), result.email!, result.userName, profile);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final result = await client.modules.auth.email.authenticate(email, password);

      if (!result.success) {
        throw ServerException(result.failReason?.toString() ?? "Not successful");
      }

      if (result.userInfo == null) {
        throw const ServerException("User info not found");
      }

      if (result.userInfo!.id == null) {
        throw const ServerException("User info not found");
      }

      await sessionManager.registerSignedInUser(
        result.userInfo!,
        result.keyId!,
        result.key!,
      );

      final profile = await _fetchProfile(result.userInfo!.id!);

      return _userWithProfile(result.userInfo!.id!.toString(), result.userInfo!.email!, result.userInfo!.userName, profile);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await sessionManager.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
