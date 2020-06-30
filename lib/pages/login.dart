import 'dart:async';
import 'dart:ui';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:we_chat/common/config/index.dart';
import 'package:we_chat/common/service/baseApi.dart';

// import 'package:we_chat/common/utils/adapt.dart';
// import 'package:we_chat/common/utils/share_prefs.dart';
import 'package:we_chat/router/NavigatorUtil.dart';
import 'package:we_chat/widgets/text_tap.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  ScrollController _scrollController = ScrollController();
  String _username = '';
  String _pwd = '';
  Timer _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  /// 应用尺寸改变时回调，例如旋转
  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollToBottom();
    });
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  void scrollToBottom() async {
    await _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void submit() {
    print('submit');
    EasyLoading.show(status: '请稍候...');
    DioInstance.getInstance().post(
      '/login',
      data: {'username': _username, 'pwd': _pwd},
    ).then((res) async {
      if (res['code'] == 200) {
        // final prefs = await SharePrefs.getInstance();
        // prefs.setString(getConfig()['token'], res['token']);
        SpUtil.putString(getConfig()['token'], res['token']);

        _timer = Timer(Duration(milliseconds: 1000), () {
          EasyLoading.dismiss();
          NavigatorUtil.goAppPage(context);
        });
      } else {
        _timer = Timer(Duration(milliseconds: 1000), () {
          EasyLoading.showError('登录失败！');
        });
      }
    });
  }

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0, left: 20),
              child: Text(
                '微信号/QQ号/邮箱',
                style: TextStyle(
                  fontSize: 26.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 52.0,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: Divider.createBorderSide(context, width: 0.6),
                        ),
                      ),
                      child: CupertinoTextField(
                        placeholder: '微信号/QQ号/邮箱',
                        placeholderStyle: TextStyle(
                          fontSize: 18,
                          color: isDarkMode(context)
                              ? Color(0xFF585858)
                              : Color(0xFFA3A3A3),
                        ),
                        prefix: Container(
                          width: 114.0,
                          child: Text(
                            '用户名',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              // color: Colors.black,
                            ),
                          ),
                        ),
                        clearButtonMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          // height: 1.0,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        maxLength: 12,
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 52.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: Divider.createBorderSide(context, width: 0.6),
                        ),
                      ),
                      child: CupertinoTextField(
                        placeholder: '请填写密码',
                        placeholderStyle: TextStyle(
                          fontSize: 18,
                          color: isDarkMode(context)
                              ? Color(0xFF585858)
                              : Color(0xFFA3A3A3),
                        ),
                        prefix: Container(
                          width: 114.0,
                          child: Text(
                            '密码',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              // color: Colors.black,
                            ),
                          ),
                        ),
                        clearButtonMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _pwd = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: TextTapWidget(
                text: '用手机号登录',
                color: Color(0xFF59688F),
                onTap: () {
                  print('用手机号登录');
                },
              ),
            ),
            Container(
              // width: double.infinity,
              // height: 48.0,
              padding: EdgeInsets.fromLTRB(
                20.0,
                60.0,
                20.0,
                20.0,
              ),
              child: RaisedButton(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                disabledTextColor:
                    isDarkMode(context) ? Color(0xFF505050) : Color(0xFFB1B1B1),
                textColor: Color(0xFFFFFFFF),
                onPressed: (_username.isEmpty || _pwd.isEmpty)
                    ? null
                    : () {
                        submit();
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
