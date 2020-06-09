import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// import 'package:socket_io/socket_io.dart';

import 'common/utils/index.dart';
import 'router/application.dart';
import 'router/routes.dart';

void main() {

  // 注册fluro routes
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
