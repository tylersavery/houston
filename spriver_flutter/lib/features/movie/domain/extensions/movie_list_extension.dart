import 'package:spriver_client/spriver_client.dart';

extension MovieListExtension on MovieList {
  bool get canLoadMore {
    return page * limit < count;
  }
}
