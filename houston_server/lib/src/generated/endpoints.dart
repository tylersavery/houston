/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/asset_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/food_endpoint.dart' as _i4;
import '../endpoints/game_endpoint.dart' as _i5;
import '../endpoints/game_system_endpoint.dart' as _i6;
import '../endpoints/movie_endpoint.dart' as _i7;
import 'package:houston_server/src/generated/food.dart' as _i8;
import 'package:houston_server/src/generated/game.dart' as _i9;
import 'package:houston_server/src/generated/game_system.dart' as _i10;
import 'package:houston_server/src/generated/movie.dart' as _i11;
import 'package:serverpod_auth_server/module.dart' as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'asset': _i2.AssetEndpoint()
        ..initialize(
          server,
          'asset',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'food': _i4.FoodEndpoint()
        ..initialize(
          server,
          'food',
          null,
        ),
      'game': _i5.GameEndpoint()
        ..initialize(
          server,
          'game',
          null,
        ),
      'gameSystem': _i6.GameSystemEndpoint()
        ..initialize(
          server,
          'gameSystem',
          null,
        ),
      'movie': _i7.MovieEndpoint()
        ..initialize(
          server,
          'movie',
          null,
        ),
    };
    connectors['asset'] = _i1.EndpointConnector(
      name: 'asset',
      endpoint: endpoints['asset']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['asset'] as _i2.AssetEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['asset'] as _i2.AssetEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['food'] = _i1.EndpointConnector(
      name: 'food',
      endpoint: endpoints['food']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderBy': _i1.ParameterDescription(
              name: 'orderBy',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['food'] as _i4.FoodEndpoint).list(
            session,
            page: params['page'],
            limit: params['limit'],
            orderBy: params['orderBy'],
          ),
        ),
        'retrieve': _i1.MethodConnector(
          name: 'retrieve',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['food'] as _i4.FoodEndpoint).retrieve(
            session,
            params['id'],
          ),
        ),
        'save': _i1.MethodConnector(
          name: 'save',
          params: {
            'food': _i1.ParameterDescription(
              name: 'food',
              type: _i1.getType<_i8.FoodDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['food'] as _i4.FoodEndpoint).save(
            session,
            params['food'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['food'] as _i4.FoodEndpoint).delete(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['game'] = _i1.EndpointConnector(
      name: 'game',
      endpoint: endpoints['game']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderBy': _i1.ParameterDescription(
              name: 'orderBy',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i5.GameEndpoint).list(
            session,
            page: params['page'],
            limit: params['limit'],
            orderBy: params['orderBy'],
          ),
        ),
        'retrieve': _i1.MethodConnector(
          name: 'retrieve',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i5.GameEndpoint).retrieve(
            session,
            params['id'],
          ),
        ),
        'save': _i1.MethodConnector(
          name: 'save',
          params: {
            'game': _i1.ParameterDescription(
              name: 'game',
              type: _i1.getType<_i9.GameDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i5.GameEndpoint).save(
            session,
            params['game'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['game'] as _i5.GameEndpoint).delete(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['gameSystem'] = _i1.EndpointConnector(
      name: 'gameSystem',
      endpoint: endpoints['gameSystem']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderBy': _i1.ParameterDescription(
              name: 'orderBy',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gameSystem'] as _i6.GameSystemEndpoint).list(
            session,
            page: params['page'],
            limit: params['limit'],
            orderBy: params['orderBy'],
          ),
        ),
        'retrieve': _i1.MethodConnector(
          name: 'retrieve',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gameSystem'] as _i6.GameSystemEndpoint).retrieve(
            session,
            params['id'],
          ),
        ),
        'save': _i1.MethodConnector(
          name: 'save',
          params: {
            'gameSystem': _i1.ParameterDescription(
              name: 'gameSystem',
              type: _i1.getType<_i10.GameSystemDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gameSystem'] as _i6.GameSystemEndpoint).save(
            session,
            params['gameSystem'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gameSystem'] as _i6.GameSystemEndpoint).delete(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['movie'] = _i1.EndpointConnector(
      name: 'movie',
      endpoint: endpoints['movie']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'orderBy': _i1.ParameterDescription(
              name: 'orderBy',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i7.MovieEndpoint).list(
            session,
            page: params['page'],
            limit: params['limit'],
            orderBy: params['orderBy'],
          ),
        ),
        'retrieve': _i1.MethodConnector(
          name: 'retrieve',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i7.MovieEndpoint).retrieve(
            session,
            params['id'],
          ),
        ),
        'save': _i1.MethodConnector(
          name: 'save',
          params: {
            'movie': _i1.ParameterDescription(
              name: 'movie',
              type: _i1.getType<_i11.MovieDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i7.MovieEndpoint).save(
            session,
            params['movie'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movie'] as _i7.MovieEndpoint).delete(
            session,
            params['id'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i12.Endpoints()..initializeEndpoints(server);
  }
}
