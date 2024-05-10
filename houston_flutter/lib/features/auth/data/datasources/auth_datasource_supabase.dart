import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:houston_flutter/config/env.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:houston_flutter/features/profile/domain/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class AuthDataSourceSupabaseImpl implements AuthDataSource {
  final SupabaseClient client;

  AuthDataSourceSupabaseImpl(this.client);

  User _userWithProfile(String id, String email, Profile profile) {
    return User(
      id: id,
      email: email,
      username: profile.username,
      firstName: profile.firstName,
      lastName: profile.lastName,
      bio: profile.bio,
      avatar: profile.avatar,
    );
  }

  Future<Profile> _fetchProfile(String userId) async {
    try {
      final profileData = await client.from("profile").select("*").eq('uid', userId).single();
      return Profile.fromJson(profileData);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> currentUser() async {
    final u = client.auth.currentSession?.user;
    if (u == null) {
      return null;
    }

    final profile = await _fetchProfile(u.id);

    return _userWithProfile(u.id, u.email ?? '', profile);
  }

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final result = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (result.session != null) {
        final userId = result.session!.user.id;

        final profile = await _fetchProfile(userId);

        return _userWithProfile(userId, email, profile);
      }
      throw const ServerException();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> register({required String email, required String username, required String password}) async {
    try {
      await client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: kIsWeb ? null : '${Env.supabaseDeeplinkProtocol}://login-callback/',
        data: {
          'username': username,
          'first_name': '',
          'last_name': '',
          'avatar': '',
          'bio': '',
        },
      );
      return true;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> confirmRegistration({required String email, required String verificationCode}) async {
    try {
      final result = await client.auth.verifyOTP(
        token: verificationCode,
        type: OtpType.email,
        email: email,
      );

      if (result.user != null) {
        final userId = result.user!.id;

        final profile = await _fetchProfile(userId);
        return _userWithProfile(userId, email, profile);
      }
      throw const ServerException();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await client.auth.signOut();
  }
}
