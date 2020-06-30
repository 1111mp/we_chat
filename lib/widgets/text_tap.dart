import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTapWidget extends StatefulWidget {
  final String text;
  final Color color;
  final Function onTap;

  const TextTapWidget({
    Key key,
    @required this.text,
    this.onTap,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  _TextTapWidget createState() => _TextTapWidget();
}

class _TextTapWidget extends State<TextTapWidget> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: GestureDetector(
        child: Text(
          widget.text,
          style: TextStyle(
            color: _active ? widget.color.withOpacity(0.6) : widget.color,
          ),
        ),
        onTap: widget.onTap,
        onTapDown: (TapDownDetails details) {
          setState(() {
            _active = true;
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            _active = false;
          });
        },
      ),
    );
  }
}
