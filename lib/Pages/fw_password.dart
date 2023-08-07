import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:hush/Pages/Register_page.dart';
// import 'package:hush/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

@override
void dispose() {
  emailcontroller.dispose();
}

Future passwordReset() async {
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailcontroller.text.trim());
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}

final emailcontroller = TextEditingController();

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Forgot Password')),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 250),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  width: 350,
                  child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          filled: true,
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.indigo,
                          ),
                          fillColor: const Color(0xFFF4F8FF),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.indigo, width: 5),
                              borderRadius: BorderRadius.circular(11)))),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: passwordReset,
                  child: Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.indigo,
                )
              ]),
        ),
      ),
    );
  }
}
