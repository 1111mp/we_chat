import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:socket_io/socket_io.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:we_chat/common/config/index.dart';

import 'common/utils/index.dart';
import 'router/application.dart';
import 'router/routes.dart';

Future<void> main() async {
  Config.env = Env.PROD;

  /// sp初始化
  await SpUtil.getInstance();

  // 注册fluro routes
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
  getCnfInstance().setEasyLoadingCnf();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: FlutterEasyLoading(
        child: MaterialApp(
          title: 'we_chat',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: white,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          onGenerateRoute: Application.router.generator,
        ),
      ),
    );
  }
}
