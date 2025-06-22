enum ServerBackendOption {
  serverpod,
  supabase,
  django,
  // firebase,
}

class Constants {
  static const appName = "houston";
  static const serverBackend = ServerBackendOption.django;
  static const routerRouteInsertToken = '//::HOUSTON_INSERT_ROUTE::';
  static const dashboardTabInsertToken = '//::HOUSTON_INSERT_TAB::';
  static const dashboardNavInsertToken = '//::HOUSTON_INSERT_NAV::';
  static const formElementTypes = ['char', 'text', 'int', 'double', 'url'];
  static const primitives = [
    'char',
    'text',
    'string',
    'url',
    'bool',
    'int',
    'double',
    'datetime'
  ];
  static const hiddenFields = ['id', 'uid', 'createdAt'];
}
