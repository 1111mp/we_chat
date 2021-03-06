import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/common/config/index.dart';
// import 'package:we_chat/common/utils/share_prefs.dart';
import 'package:we_chat/router/NavigatorUtil.dart';
// import 'package:rxdart/rxdart.dart';

class SplashPag extends StatefulWidget {
  @override
  _SplashPagState createState() => _SplashPagState();
}

class _SplashPagState extends State<SplashPag> {
  Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(seconds: 2), () async {
      // final SharePrefs prefs = await SharePrefs.getInstance();
      // final String token = prefs.getString(getConfig()['token']);
      final String token = SpUtil.getString(getConfig()['token']);
      print(token);
      if (token.isEmpty) {
        /** 未登录 */
        NavigatorUtil.goAppPage(context);
      } else {
        /** 登录 */
        NavigatorUtil.goAppPage(context);
      }
    });
    // Future.delayed(Duration(seconds: 5), () {
    //   NavigatorUtil.goHomePage(context);
    // });

    /// 2秒后跳转到主页面，上面注释的代码也可以做到倒计时
    // Observable.timer(0, Duration(seconds: 2)).listen((_) {
    //   /// 然后看 NavigatorUtil.dart
    //   NavigatorUtil.goHomePage(context);
    // });
    super.initState();
  }

  // 生命周期 Widget组件销毁时执行
  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('我是欢迎页面'),
        ),
      ),
    );
  }
}
