import 'package:flutter/material.dart';
import 'package:authentication/pages/login_page.dart';
import 'package:authentication/pages/register_page.dart';

class LogOrRegister extends StatefulWidget {

  const LogOrRegister({super.key});

  @override
  State<LogOrRegister> createState() => _LogOrRegisterState();
}

class _LogOrRegisterState extends State<LogOrRegister> {
  bool showLogin = true;

  void toggleView(){
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin){
      return LoginPage(onTap: toggleView);
    }
    else{
      return RegisterPage(onTap: toggleView);
    }
  }
}