enum ServerBackendOption {
  serverpod,
  supabase,
  // django,
  // firebase,
}

class Constants {
  static const defaultPaginationLimit = 2;
  static const serverBackend = ServerBackendOption.serverpod;
  static const supabaseSignupRequiresConfirmation = false;
}
