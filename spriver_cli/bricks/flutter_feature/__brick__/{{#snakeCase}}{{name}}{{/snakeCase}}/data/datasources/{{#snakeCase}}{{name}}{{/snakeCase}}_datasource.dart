import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:spriver_client/spriver_client.dart';

import '../../../../core/error/exceptions.dart';

abstract interface class {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}List> list({required int page, required int limit});
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(int id);
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}});
  Future<void> delete(int id);
}