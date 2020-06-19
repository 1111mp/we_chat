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

    // this.initIMessage();
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
            icon: Icon(
              IconData(0xe7f9, fontFamily: 'IconFont'),
              size: 28,
            ),
            activeIcon: Icon(
              IconData(0xe7f8, fontFamily: 'IconFont'),
              size: 28,
            ),
            title: Text('微信'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe601, fontFamily: 'IconFont'),
              size: 28,
            ),
            activeIcon: Icon(
              IconData(0xe600, fontFamily: 'IconFont'),
              size: 28,
            ),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe66c, fontFamily: 'IconFont'),
              size: 24,
            ),
            activeIcon: Icon(
              IconData(0xe68f, fontFamily: 'IconFont'),
              size: 24,
            ),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe60d, fontFamily: 'IconFont'),
              size: 24,
            ),
            activeIcon: Icon(
              IconData(0xe60e, fontFamily: 'IconFont'),
              size: 24,
            ),
            title: Text('我'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
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
