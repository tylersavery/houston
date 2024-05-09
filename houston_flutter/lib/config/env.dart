import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor {
  develop,
  stage,
  production,
}

Flavor _env = Flavor.develop;

class Env {
  static init() async {
    String? envPath;

    /// Allows you to dart-define an ENV flavor, overriding the one above
    const envOverride = String.fromEnvironment("ENV");
    if (envOverride.isNotEmpty) {
      if (envOverride == "develop") {
        _env = Flavor.develop;
      } else if (envOverride == "stage") {
        _env = Flavor.stage;
      } else if (envOverride == "production") {
        _env = Flavor.production;
      }
    }

    switch (_env) {
      case Flavor.develop:
        envPath = "assets/env/develop_env";
        break;
      case Flavor.stage:
        envPath = "assets/env/stage_env";
        break;
      case Flavor.production:
        envPath = "assets/env/production_env";
        break;
    }

    await dotenv.load(fileName: envPath);
  }

  static String get flavorName {
    return dotenv.env['FLAVOR_NAME'] ?? 'unset';
  }

  static bool get debug {
    return dotenv.env['DEBUG']?.toLowerCase() == "true";
  }

  static String get appBaseUrl {
    return dotenv.env['APP_BASE_URL'] ?? "https://domain.com";
  }

  static String get supabaseProject {
    return dotenv.env['SUPABASE_PROJECT'] ?? '';
  }

  static String get supabaseAnonKey {
    return dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  }

  /// Note: this also needs to be configured in your info.plist for ios
  /// I assume something similar for android too - TODO: review docs!
  static String get supabaseDeeplinkProtocol {
    return dotenv.env['SUPABASE_DEEPLINK_PROTOCOL'] ?? '';
  }

  static String get supabaseBucketName {
    return dotenv.env['SUPABASE_BUCKET_NAME'] ?? '';
  }
}
