class Env {
  static String get environmentName {
    return const String.fromEnvironment("ENVIRONMENT_NAME");
  }

  static bool get debug {
    return const String.fromEnvironment("DEBUG").toLowerCase() == "true";
  }

  static String get apiBaseUrl {
    return const String.fromEnvironment("API_BASE_URL");
  }

  static String get supabaseProject {
    return const String.fromEnvironment("SUPABASE_PROJECT");
  }

  static String get supabaseAnonKey {
    return const String.fromEnvironment("SUPABASE_ANON_KEY");
  }

  /// Note: this also needs to be configured in your info.plist for ios
  /// I assume something similar for android too - TODO: review docs!
  static String get supabaseDeeplinkProtocol {
    return const String.fromEnvironment("SUPABASE_DEEPLINK_PROTOCOL");
  }

  static String get supabaseBucketName {
    return const String.fromEnvironment("SUPABASE_BUCKET_NAME");
  }
}
