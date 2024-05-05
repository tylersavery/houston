import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../domain/usecases/{{#snakeCase}}{{name}}{{/snakeCase}}_retrieve_usecase.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.g.dart';

@riverpod
Future<{{#pascalCase}}{{name}}{{/pascalCase}}> {{#camelCase}}{{name}}{{/camelCase}}Detail({{#pascalCase}}{{name}}{{/pascalCase}}DetailRef ref, int id) async {
  final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RetrieveUseCaseProvider)(Retrieve{{#pascalCase}}{{name}}{{/pascalCase}}Params(id: id));
  return result.fold((failure) => throw Exception(failure), ({{#camelCase}}{{name}}{{/camelCase}}) => {{#camelCase}}{{name}}{{/camelCase}});
}
