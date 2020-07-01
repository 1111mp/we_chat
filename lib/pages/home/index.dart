import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:we_chat/pages/home/room_item.dart';
import 'package:we_chat/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final SlidableController _slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: '微信',
        isBack: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: 2,
          itemExtent: 70.0,
          itemBuilder: (context, index) {
            return RoomItem(
              index: index,
              slidableController: _slidableController,
            );
          },
        ),
      ),
    );
  }
}
