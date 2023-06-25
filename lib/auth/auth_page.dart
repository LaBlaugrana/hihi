import 'package:flutter/material.dart';
import 'package:hush/Pages/Register_page.dart';
import 'package:hush/Pages/login.dart';


class Authpage extends StatefulWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {

  //INITIALLY,SHOW THE LOGIN PAGE
  bool showLoginPage=true;
  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(showRegisterpage: toggleScreens);
    }
    else{
      return RegisterPage(showLoginPage:toggleScreens );
    }
  }
}
