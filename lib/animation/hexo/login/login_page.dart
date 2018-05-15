
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test1/animation/hexo/login/home_page.dart';



class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  bool isLogin=false;

  onLoginClick(){
   Future.delayed(Duration(seconds: 2), () {
     Navigator.of(context).pushNamed(HomePage.tag);
     isLogin=false;
    });
   setState(() {
     isLogin=true;

   });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isLogin=false;
  }
  @override
  Widget build(BuildContext context) {
    var loginButtonWidegt;
    if(isLogin) {
      AnimationController animationController=new AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
      Animation<Color> animation=new Tween(begin: Colors.white,end:Colors.black).animate(animationController);
      loginButtonWidegt =CircularProgressIndicator(backgroundColor: Colors.white,valueColor: animation,);
    }else{
      loginButtonWidegt = Text(
          'Log In', style: TextStyle(color: Colors.white));
    }
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: onLoginClick,
          color: Colors.lightBlueAccent,
          child:loginButtonWidegt,
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
