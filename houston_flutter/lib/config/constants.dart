enum ServerBackendOption {
  serverpod,
  supabase,
  // django,
  // firebase,
}

class Constants {
  static const defaultPaginationLimit = 2;
  static const serverBackend = ServerBackendOption.supabase;
  static const supabaseSignupRequiresConfirmation = false;
}
