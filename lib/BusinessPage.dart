import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPage createState() => _BusinessPage();
}

class _BusinessPage extends State<BusinessPage>
    with SingleTickerProviderStateMixin {
  var tabList = ['淘宝', '京东', '拼多多'];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('业务'),
        centerTitle: true,
        leading: Text(''),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabList.map((e) => Tab(text: e)).toList(),
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: new TabBarView(
        controller: _tabController, //配置控制器
        children: [ // Tab 内容
          new Text(tabList[0]),
          new Text(tabList[1]),
          new Text(tabList[2]),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
