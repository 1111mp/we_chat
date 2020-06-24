import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:we_chat/common/utils/adapt.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                          bottom: BorderSide(
                            width: Adapt.onepx(),
                            color: Color(0xFFD5D5D5),
                          ),
                        ),
                      ),
                      child: CupertinoTextField(
                        // controller: _controller,
                        placeholder: '微信号/QQ号/邮箱',
                        placeholderStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFA7A7A7),
                        ),
                        prefix: Container(
                          width: 114.0,
                          child: Text(
                            '用户名',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        clearButtonMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlignVertical: TextAlignVertical.center,
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
                          bottom: BorderSide(
                            width: Adapt.onepx(),
                            color: Color(0xFFD5D5D5),
                          ),
                        ),
                      ),
                      child: CupertinoTextField(
                        // controller: _controller,
                        placeholder: '请填写密码',
                        placeholderStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFA7A7A7),
                        ),
                        prefix: Container(
                          width: 114.0,
                          child: Text(
                            '密码',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Text('用手机号登录'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                20.0,
                60.0,
                20.0,
                20.0,
              ),
              child: RaisedButton(
                child: Text('登录'),
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
