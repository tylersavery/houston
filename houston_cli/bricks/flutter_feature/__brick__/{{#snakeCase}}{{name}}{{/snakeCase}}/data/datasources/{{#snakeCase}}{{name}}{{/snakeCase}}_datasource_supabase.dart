import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
{{#supabaseDatasourceImports}}{{{.}}}
{{/supabaseDatasourceImports}}

class {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceSupabaseImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  final SupabaseClient client;

  const {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceSupabaseImpl(this.client);

  static String defaultSelect = "*{{#supabaseDatasourceJoins}}{{{.}}}{{/supabaseDatasourceJoins}}";


  @override
  Future<PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>> list({required int page, required int limit, {{{datasourceRelationshipParams}}}}) async {
    try {
      final result = await client
          .from("{{#snakeCase}}{{name}}{{/snakeCase}}")
          .select(
            defaultSelect,
          )
          .range((page - 1) * limit, limit * page)
          .count(CountOption.exact);

      return PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>(
        results: result.data.map<{{#pascalCase}}{{name}}{{/pascalCase}}>((item) => {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(item)).toList(),
        status: 200,
        count: result.count,
        page: page,
        limit: limit,
        numPages: (result.count / limit).ceil(),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(int id) async {
    try {
      final result = await client.from("{{#snakeCase}}{{name}}{{/snakeCase}}").select(defaultSelect).eq('id', id).single();
      return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(result);
    } catch (e) {
      throw const ServerException("Not Found");
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    try {
      if ({{#camelCase}}{{name}}{{/camelCase}}.id == null) {
        final result = await client.from("{{#snakeCase}}{{name}}{{/snakeCase}}").insert({{#camelCase}}{{name}}{{/camelCase}}.toJson()).select(defaultSelect).single();
        return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(result);
      } else {
        final result = await client.from("{{#snakeCase}}{{name}}{{/snakeCase}}").update({{#camelCase}}{{name}}{{/camelCase}}.toJson()).match({"id": {{#camelCase}}{{name}}{{/camelCase}}.id}).select(defaultSelect).single();
        return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(result);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.from("{{#snakeCase}}{{name}}{{/snakeCase}}").delete().match({"id": id});
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
