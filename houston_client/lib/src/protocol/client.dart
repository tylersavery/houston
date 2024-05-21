/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:houston_client/src/protocol/game_list.dart' as _i3;
import 'package:houston_client/src/protocol/game.dart' as _i4;
import 'package:houston_client/src/protocol/game_system_list.dart' as _i5;
import 'package:houston_client/src/protocol/game_system.dart' as _i6;
import 'package:houston_client/src/protocol/movie_list.dart' as _i7;
import 'package:houston_client/src/protocol/movie.dart' as _i8;
import 'package:houston_client/src/protocol/profile_list.dart' as _i9;
import 'package:houston_client/src/protocol/profile.dart' as _i10;
import 'package:serverpod_auth_client/module.dart' as _i11;
import 'protocol.dart' as _i12;

/// {@category Endpoint}
class EndpointAsset extends _i1.EndpointRef {
  EndpointAsset(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'asset';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'asset',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'asset',
        'verifyUpload',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointGame extends _i1.EndpointRef {
  EndpointGame(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'game';

  _i2.Future<_i3.GameDTOList> list({
    required int page,
    required int limit,
    String? orderBy,
    String? gameSystemUid,
  }) =>
      caller.callServerEndpoint<_i3.GameDTOList>(
        'game',
        'list',
        {
          'page': page,
          'limit': limit,
          'orderBy': orderBy,
          'gameSystemUid': gameSystemUid,
        },
      );

  _i2.Future<_i4.GameDTO?> retrieve(int id) =>
      caller.callServerEndpoint<_i4.GameDTO?>(
        'game',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i4.GameDTO> save(_i4.GameDTO game) =>
      caller.callServerEndpoint<_i4.GameDTO>(
        'game',
        'save',
        {'game': game},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'game',
        'delete',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointGameSystem extends _i1.EndpointRef {
  EndpointGameSystem(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'gameSystem';

  _i2.Future<_i5.GameSystemDTOList> list({
    required int page,
    required int limit,
    String? orderBy,
  }) =>
      caller.callServerEndpoint<_i5.GameSystemDTOList>(
        'gameSystem',
        'list',
        {
          'page': page,
          'limit': limit,
          'orderBy': orderBy,
        },
      );

  _i2.Future<_i6.GameSystemDTO?> retrieve(int id) =>
      caller.callServerEndpoint<_i6.GameSystemDTO?>(
        'gameSystem',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i6.GameSystemDTO> save(_i6.GameSystemDTO gameSystem) =>
      caller.callServerEndpoint<_i6.GameSystemDTO>(
        'gameSystem',
        'save',
        {'gameSystem': gameSystem},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'gameSystem',
        'delete',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMovie extends _i1.EndpointRef {
  EndpointMovie(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'movie';

  _i2.Future<_i7.MovieDTOList> list({
    required int page,
    required int limit,
    String? orderBy,
  }) =>
      caller.callServerEndpoint<_i7.MovieDTOList>(
        'movie',
        'list',
        {
          'page': page,
          'limit': limit,
          'orderBy': orderBy,
        },
      );

  _i2.Future<_i8.MovieDTO?> retrieve(int id) =>
      caller.callServerEndpoint<_i8.MovieDTO?>(
        'movie',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i8.MovieDTO> save(_i8.MovieDTO movie) =>
      caller.callServerEndpoint<_i8.MovieDTO>(
        'movie',
        'save',
        {'movie': movie},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'movie',
        'delete',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointProfile extends _i1.EndpointRef {
  EndpointProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  _i2.Future<_i9.ProfileDTOList> list({
    required int page,
    required int limit,
    String? orderBy,
  }) =>
      caller.callServerEndpoint<_i9.ProfileDTOList>(
        'profile',
        'list',
        {
          'page': page,
          'limit': limit,
          'orderBy': orderBy,
        },
      );

  _i2.Future<_i10.ProfileDTO?> retrieve(int id) =>
      caller.callServerEndpoint<_i10.ProfileDTO?>(
        'profile',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i10.ProfileDTO?> retrieveByUserId(int userId) =>
      caller.callServerEndpoint<_i10.ProfileDTO?>(
        'profile',
        'retrieveByUserId',
        {'userId': userId},
      );

  _i2.Future<_i10.ProfileDTO> save(_i10.ProfileDTO profile) =>
      caller.callServerEndpoint<_i10.ProfileDTO>(
        'profile',
        'save',
        {'profile': profile},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'profile',
        'delete',
        {'id': id},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i11.Caller(client);
  }

  late final _i11.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i12.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    asset = EndpointAsset(this);
    example = EndpointExample(this);
    game = EndpointGame(this);
    gameSystem = EndpointGameSystem(this);
    movie = EndpointMovie(this);
    profile = EndpointProfile(this);
    modules = _Modules(this);
  }

  late final EndpointAsset asset;

  late final EndpointExample example;

  late final EndpointGame game;

  late final EndpointGameSystem gameSystem;

  late final EndpointMovie movie;

  late final EndpointProfile profile;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'asset': asset,
        'example': example,
        'game': game,
        'gameSystem': gameSystem,
        'movie': movie,
        'profile': profile,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
