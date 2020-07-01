import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:socket_io/socket_io.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:we_chat/common/config/index.dart';
import 'package:we_chat/common/provider/theme_provider.dart';

// import 'common/utils/index.dart';
import 'router/application.dart';
import 'router/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Config.env = Env.DEV;

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
  final ThemeData theme;

  MyApp({this.theme}) {
    /// 初始化
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: FlutterEasyLoading(
        child: ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                title: 'we_chat',
                debugShowCheckedModeBanner: false,
                theme: theme ?? provider.getTheme(),
                darkTheme: provider.getTheme(isDarkMode: true),
                themeMode: provider.getThemeMode(),
                onGenerateRoute: Application.router.generator,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('zh', 'CN'),
                  const Locale('en', 'US'),
                ],
                builder: (context, child) {
                  return MediaQuery(
                    /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    // 或者 MediaQueryData.fromWindow(WidgetsBinding.instance.window).copyWith(textScaleFactor: 1.0),
                    child: child,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
