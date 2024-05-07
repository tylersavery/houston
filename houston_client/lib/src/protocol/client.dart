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
import 'package:houston_client/src/protocol/food_list.dart' as _i3;
import 'package:houston_client/src/protocol/food.dart' as _i4;
import 'package:houston_client/src/protocol/movie_list.dart' as _i5;
import 'package:houston_client/src/protocol/movie.dart' as _i6;
import 'package:serverpod_auth_client/module.dart' as _i7;
import 'protocol.dart' as _i8;

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
class EndpointFood extends _i1.EndpointRef {
  EndpointFood(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'food';

  _i2.Future<_i3.FoodDTOList> list({
    required int page,
    required int limit,
    String? orderBy,
  }) =>
      caller.callServerEndpoint<_i3.FoodDTOList>(
        'food',
        'list',
        {
          'page': page,
          'limit': limit,
          'orderBy': orderBy,
        },
      );

  _i2.Future<_i4.FoodDTO?> retrieve(int id) =>
      caller.callServerEndpoint<_i4.FoodDTO?>(
        'food',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i4.FoodDTO> save(_i4.FoodDTO food) =>
      caller.callServerEndpoint<_i4.FoodDTO>(
        'food',
        'save',
        {'food': food},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'food',
        'delete',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMovie extends _i1.EndpointRef {
  EndpointMovie(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'movie';

  _i2.Future<_i5.MovieDTOList> list({
    required int page,
    required int limit,
    String? orderBy,
  }) =>
      caller.callServerEndpoint<_i5.MovieDTOList>(
        'movie',
        'list',
        {
          'page': page,
          'limit': limit,
          'orderBy': orderBy,
        },
      );

  _i2.Future<_i6.MovieDTO?> retrieve(int id) =>
      caller.callServerEndpoint<_i6.MovieDTO?>(
        'movie',
        'retrieve',
        {'id': id},
      );

  _i2.Future<_i6.MovieDTO> save(_i6.MovieDTO movie) =>
      caller.callServerEndpoint<_i6.MovieDTO>(
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

class _Modules {
  _Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
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
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    asset = EndpointAsset(this);
    example = EndpointExample(this);
    food = EndpointFood(this);
    movie = EndpointMovie(this);
    modules = _Modules(this);
  }

  late final EndpointAsset asset;

  late final EndpointExample example;

  late final EndpointFood food;

  late final EndpointMovie movie;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'asset': asset,
        'example': example,
        'food': food,
        'movie': movie,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
