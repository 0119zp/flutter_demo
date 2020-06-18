import 'package:flutter/material.dart';

class UserCenterPage extends StatefulWidget {
  @override
  _UserCenterPage createState() => _UserCenterPage();
}

class _UserCenterPage extends State<UserCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                  child: ClipOval(
                    child: Image.network(
                      'http://up.enterdesk.com/edpic/b2/c2/8b/b2c28b1d615167bbd5a829d1d35c3b47.jpg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'flutter 小王子',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Text(
                      '我喜欢湖畔的风，因为有水的宁静',
                      style: TextStyle(fontSize: 12, color: Colors.redAccent),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 10.0,
              color: Color(0xFFF3F3F3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.settings,
                    size: 18.0,
                    color: Colors.black26,
                  ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '设置',
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xFF333333)),
                        )),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    color: Colors.black26,
                    onPressed: () {
                      // TODO 跳到设置页面
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 5.0,
              color: Color(0xFFF3F3F3),
            ),
          ],
        ),
      ),
    );
  }
}