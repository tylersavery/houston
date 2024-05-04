import 'package:fpdart/fpdart.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../../../core/error/failures.dart';

abstract interface class {{#pascalCase}}{{name}}{{/pascalCase}}Repository {
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}List>> list({required int page, required int limit});
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> retrieve(int id);
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}});
  Future<Either<Failure, void>> delete(int id);
}
