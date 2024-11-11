import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/sherd_pre.dart';
import '../../home/ui/home_screen.dart';
import '../../login/ui/login_screen.dart';
import '../../start/ui/start_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    isLogin();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>isLogged? const HomeScreen() : const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/spalsh.png")),
    );
  }
}
bool isLogged = false;
Future isLogin() async{

  bool?  isLogin = await ShardPreHelper.getIsLogin();
  if(isLogin != null){
    isLogged = true;
  }else{
    isLogged = false;

  }

}