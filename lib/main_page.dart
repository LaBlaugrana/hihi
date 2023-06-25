import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hush/Pages/Homepage.dart';
import 'package:hush/Pages/login.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
              //user is logged in
              if (snapshot.hasData){
                return  Homepage();
              }
              //user is not logged in
              else{
                return AuthPage();
              }
            },
          )
      ),
    );
  }
}
