import 'package:houston_client/houston_client.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListState {}

class {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateInitial extends {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListState {}

class {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateLoading extends {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListState {}

class {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateSuccess extends {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListState {
  final {{#pascalCase}}{{name}}{{/pascalCase}}List data;

  {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateSuccess({required this.data});
}

class {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateFailure extends {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListState {
  final String error;
  {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateFailure({required this.error});
}
