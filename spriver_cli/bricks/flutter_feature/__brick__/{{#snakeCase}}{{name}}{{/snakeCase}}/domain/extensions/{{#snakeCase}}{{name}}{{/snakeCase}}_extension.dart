import 'package:spriver_client/spriver_client.dart';

extension {{#pascalCase}}{{name}}{{/pascalCase}}Extension on {{#pascalCase}}{{name}}{{/pascalCase}} {
  String get label {
    {{#uiHeading1}}return {{{.}}};{{/uiHeading1}}
    {{^uiHeading1}}return "$id";{{/uiHeading1}}
  }
}
