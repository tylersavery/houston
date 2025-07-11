import 'package:houston_server/src/utils/strings.dart';
import 'package:serverpod/serverpod.dart';

import 'package:houston_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:serverpod_cloud_storage_s3/serverpod_cloud_storage_s3.dart'
    as s3;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
    // Send your validation email here.
    print("Email Validation Code: $validationCode");
    return true;
  }, sendPasswordResetEmail: (session, userInfo, validationCode) async {
    // Send a password reset email here.
    print("Password Reset Code: $validationCode");
    return true;
  }, onUserCreated: (session, userInfo) async {
    final uid = await _uniqueProfileUid(session);

    await ProfileDTO.db.insertRow(
      session,
      ProfileDTO(
        userId: userInfo.id!,
        uid: uid,
        username: userInfo.userName,
        firstName: '',
        lastName: '',
        avatar: userInfo.imageUrl ?? '',
        createdAt: DateTime.now(),
      ),
    );
  }));

  pod.addCloudStorage(s3.S3CloudStorage(
    serverpod: pod,
    storageId: 'public',
    public: true,
    region: 'ca-central-1',
    bucket: 'listie-dev',
  ));

  // Start the server.
  await pod.start();
}

Future<String> _uniqueProfileUid(Session session) async {
  late String uid;

  while (true) {
    uid = generateRandomString(8);
    final unique = (await ProfileDTO.db
            .findFirstRow(session, where: (row) => row.uid.equals(uid))) ==
        null;
    if (unique) {
      return uid;
    }
  }
}
