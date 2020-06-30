import 'package:flutter/material.dart';
import 'package:we_chat/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: '微信',
        isBack: false,
      ),
      body: SafeArea(
        child: ListView.separated(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          separatorBuilder: (context, index) => Divider(
            height: 0.6,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 54.0,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
