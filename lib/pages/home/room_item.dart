import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RoomItem extends StatefulWidget {
  const RoomItem({
    Key key,
    @required this.index,
    @required this.slidableController,
  }) : super(key: key);

  final int index;
  final SlidableController slidableController;

  @override
  _RoomItem createState() => _RoomItem();
}

class _RoomItem extends State<RoomItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.index.toString()),
      controller: widget.slidableController,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onWillDismiss: (actionType) {
          return showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('提示？'),
                  content: Text('确定删除该条记录？'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('取消'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text('确定'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                );
              });
        },
        onDismissed: (actionType) {
          print(actionType);
        },
      ),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => {},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => {},
        ),
      ],
      child: InkWell(
        onTap: () {
          /// 如果侧滑菜单打开，关闭侧滑菜单。否则跳转
          if (widget.slidableController.activeState != null) {
            widget.slidableController.activeState.close();
          } else {}
        },
        child: Container(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context, width: 0.8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: 12,
                    ),
                    width: 46.0,
                    height: 46.0,
                    color: Colors.red,
                  ),
                  Text('sss'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
