import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.message), onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('提示'),
                  content: Text('确认进入消息页面吗？'),
                  actions: <Widget>[
                    FlatButton(child: Text('取消'),onPressed: (){
                      Navigator.of(context).pop('cancel');
                    },),
                    FlatButton(child: Text('确认'),onPressed: (){},),
                  ],
                );
              }
            );
          })
        ],
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('首页'),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 58.0, bottom: 40.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.network(
                        "http://up.enterdesk.com/edpic/1c/0b/5c/1c0b5cf00211a76bcf079672992a8b0b.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    "小狐狸",
                    style: TextStyle(fontSize:16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}