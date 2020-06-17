import 'dart:io';

import 'package:demo/Login.dart';
import 'package:demo/SlidePageRouteBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
//  if (Platform.isAndroid) {
//    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
//        statusBarColor: Colors.transparent,
////        statusBarBrightness: Brightness.light,
////        statusBarIconBrightness: Brightness.dark
//    );
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //AnimationController是Animation的一个子类，它可以控制Animation，可以控制动画的时间，类型，过渡3曲线
  AnimationController _controller;
  Animation _animation;
  bool isShowLoginBtn = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    //上面两行代码表示初始化一个Animation控制器， vsync垂直同步，动画执行时间3000毫秒,然后我们设置一个Animation动画，使用上面设置的控制器

    //监听动画运行状态，当状态为completed时，动画执行结束，跳转首页
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isShowLoginBtn = true;
        });
      }
    });
    _controller.forward(); // 播放动画
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); //释放动画
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        FadeTransition(
          //透明度动画组件
          opacity: _animation, //动画

          child: Image.asset(
            'images/splash.png',
//            'http://pic.netbian.com/uploads/allimg/200528/121205-159063912551bb.jpg',
            fit: BoxFit.scaleDown, //图片可以完整显示，但是可能不能填充满。
            scale: 1, //进行缩放
          ),
        ),
        Visibility(
          child: Positioned(
            top: 102.0,
            child: OutlineButton.icon(
              icon: Icon(
                Icons.forward,
                color: Colors.deepOrange,
              ),
              label: Text(
                '登录',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onPressed: () {
                Navigator.push(context, SlidePageRouteBuilder(Login()));
              },
            ),
          ),
          visible: isShowLoginBtn,
        ),
      ],
    );
  }
}
