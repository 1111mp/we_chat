import 'package:flutter/material.dart';
import 'package:we_chat/common/imessage/index.dart';

import 'router/route_handlers.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PageController _pageController;
  int _tabIndex = 0;
  final List<Widget> _pageList = getPageList();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: this._tabIndex,
      keepPage: true,
    );

    this.initIMessage();
  }

  void initIMessage() {
    IMessage.getInstance();
  }

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pageList,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('微信'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        iconSize: 24.0,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedItemColor: Color(0xFF57BE6A),
      ),
    );
  }
}
