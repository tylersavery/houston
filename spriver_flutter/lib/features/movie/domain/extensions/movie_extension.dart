import 'package:spriver_client/spriver_client.dart';

extension MovieExtension on Movie {
  String get label {
    return "$title ($year)";
  }
}
