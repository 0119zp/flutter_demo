import 'package:demo/BusinessPage.dart';
import 'package:demo/HomePage.dart';
import 'package:demo/UserCenterPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;

  var _pageList;

  void initData() {
    _pageList = [HomePage(), BusinessPage(), UserCenterPage()];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.yellow, Colors.pink])),
          ),
          preferredSize: Size(double.infinity, 2)),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('业务')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.lightGreen,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
