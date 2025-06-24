import 'package:jwt_decoder/jwt_decoder.dart';

class SessionToken {
  final String access;
  final String refresh;

  SessionToken({required this.access, required this.refresh});

  Map<String, dynamic> toJson() {
    return {'access': access, 'refresh': refresh};
  }

  factory SessionToken.fromJson(Map<String, dynamic> json) {
    return SessionToken(access: json['access'], refresh: json['refresh']);
  }

  @override
  String toString() {
    return toJson().toString();
  }

  bool get accessIsExpired {
    return JwtDecoder.isExpired(access);
  }

  bool get refreshIsExpired {
    return JwtDecoder.isExpired(refresh);
  }

  DateTime? get accessExpirationDate {
    return JwtDecoder.getExpirationDate(access);
  }

  DateTime? get refreshExpirationDate {
    return JwtDecoder.getExpirationDate(refresh);
  }
}
