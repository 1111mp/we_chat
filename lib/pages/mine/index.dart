import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/common/config/index.dart';
import 'package:we_chat/common/utils/utils.dart';
import 'package:we_chat/widgets/send_type_dialog.dart';
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
            Padding(
              padding: EdgeInsets.only(top: 500),
              child: RaisedButton(
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
                onPressed: () {
                  // final prefs = await SharePrefs.getInstance();
                  // prefs.remove(getConfig()['token']);
                  // SpUtil.remove(getConfig()['token']);
                  showElasticDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return SendTypeDialog(
                          onPressed: (i, value) {
                            setState(() {
                              // _sendType = i;
                            });
                          },
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
