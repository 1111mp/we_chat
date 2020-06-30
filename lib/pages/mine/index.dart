import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/common/config/index.dart';
// import 'package:we_chat/common/utils/share_prefs.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: <Widget>[
            RaisedButton(
              child: Text(
                '退出登录',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              // color: Color(0xFFFFFFFF),
              // textColor: Color(0xFFFFFFFF),
              // disabledColor: Color(0xFFE1E1E1),
              // disabledTextColor: Color(0xFFB3B3B3),
              // highlightColor: Color(0xFF4EAB5F),
              // splashColor: Color(0xFF4EAB5F),
              onPressed: () async {
                // final prefs = await SharePrefs.getInstance();
                // prefs.remove(getConfig()['token']);
                SpUtil.remove(getConfig()['token']);
              },
            ),
          ],
        ),
      ),
    );
  }
}
