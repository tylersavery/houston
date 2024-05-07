import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
import '../../domain/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_provider.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.g.dart';

@riverpod
Future<{{#pascalCase}}{{name}}{{/pascalCase}}> {{#camelCase}}{{name}}{{/camelCase}}Detail({{#pascalCase}}{{name}}{{/pascalCase}}DetailRef ref, int id) async {
  final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider).retrieve(id);
  
  return result.fold((failure) => throw Exception(failure), ({{#camelCase}}{{name}}{{/camelCase}}) => {{#camelCase}}{{name}}{{/camelCase}});
}
