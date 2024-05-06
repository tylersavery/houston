import 'package:recase/recase.dart';

String camelCase(String string) {
  ReCase rc = ReCase(string);
  return rc.camelCase;
}

String snakeCase(String string) {
  ReCase rc = ReCase(string);
  return rc.snakeCase;
}

String pascalCase(String string) {
  ReCase rc = ReCase(string);
  return rc.pascalCase;
}

String titleCase(String string) {
  ReCase rc = ReCase(string);

  return rc.titleCase;
}

String paramCase(String string) {
  ReCase rc = ReCase(string);

  return rc.paramCase;
}
