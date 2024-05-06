import 'package:houston_client/houston_client.dart';

extension {{#pascalCase}}{{name}}{{/pascalCase}}ListExtension on {{#pascalCase}}{{name}}{{/pascalCase}}List {
  bool get canLoadMore {
    return page * limit < count;
  }
}
