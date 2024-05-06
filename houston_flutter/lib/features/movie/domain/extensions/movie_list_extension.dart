import 'package:houston_client/houston_client.dart';

extension MovieListExtension on MovieList {
  bool get canLoadMore {
    return page * limit < count;
  }
}
