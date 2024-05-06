import 'dart:math';

String generateRandomString(int len, {String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'}) {
  var r = Random();
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

String removeSpecialCharacters(String input) {
  RegExp regex = RegExp(r'[^\w\s-]'); // \w matches letters and digits, \s matches spaces
  return input.replaceAll(regex, '');
}
