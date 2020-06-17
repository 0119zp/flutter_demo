import 'package:demo/HomeScreen.dart';
import 'package:demo/SlidePageRouteBuilder.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {

  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  bool isShowPwd = false;
  String userName;
  String userPwd;

  void login() {
    var loginForm = loginKey.currentState;
    if(loginForm.validate()) {
      loginForm.save();
      Navigator.push(context, SlidePageRouteBuilder(HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('登录'),
//        automaticallyImplyLeading: false,
//        centerTitle: true,
//      ),
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            title: Center(
              child: Text(
                "登录",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          preferredSize: Size(double.infinity, 60)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 140, bottom: 10),
              child: ClipOval(
                child: Image.asset(
                  'images/login_top_image.png',
                  width: 120.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40),
              child: Form(
                key: loginKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入账号',
                          labelStyle:
                              TextStyle(fontSize: 16.0, color: Colors.blue),
                          hintText: '请输入账号',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          userName = value;
                        },
//                        validator: (phone) {
//                          if(phone.length == 0) {
//                            return '';
//                          }
//                        },
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black12, width: 0.5))),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入密码',
                          labelStyle:
                              TextStyle(fontSize: 16.0, color: Colors.blue),
                          hintText: '请输入密码',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isShowPwd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black26,
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                isShowPwd = !isShowPwd;
                              });
                            },
                          ),
                        ),
                        obscureText: isShowPwd,
                        onSaved: (value) {
                          userPwd = value;
                        },
//                        validator: (pwd) {
//                          if(pwd.length == 0) {
//                            return '请输入密码';
//                          }
//                        },
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black12, width: 0.5))),
                    ),
                    Container(
                      width: 200,
                      height: 44,
                      margin: EdgeInsets.only(top: 20),
                      child: SizedBox.expand(
                        child: RaisedButton(
                          onPressed: login,
                          color: Colors.deepOrangeAccent,
                          child: Text(
                            '登录',
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          ),

                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
