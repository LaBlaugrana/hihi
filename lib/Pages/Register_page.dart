import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navBar.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLogin;
  const RegisterPage({Key? key, required this.showLogin}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool passwordObscured = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmPasscontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmPasscontroller.dispose();
  }

  bool passwordConfirmed() {
    if (_confirmPasscontroller.text.trim() == _passwordcontroller.text) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar:AppBar(systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                      child: Image(
                    image: AssetImage('assets/images/1.png'),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 900,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFF42414D)),
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                              controller: _emailcontroller,
                              decoration: InputDecoration(
                                  filled: true,
                                  suffixIcon: const Icon(
                                    Icons.account_box_outlined,
                                    color: Colors.indigo,
                                  ),
                                  fillColor: const Color(0xFFF4F8FF),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.indigo, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(11)))),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFF42414D)),
                                  ))),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: _passwordcontroller,
                              obscureText: passwordObscured,
                              keyboardType: TextInputType
                                  .number, // Set keyboard type to numeric
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null; // Return null if validation passes
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFF4F8FF),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        passwordObscured = !passwordObscured;
                                      },
                                    );
                                  },
                                  child: Icon(
                                    passwordObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.indigo,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.indigo, width: 2),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              ),
                              // This is important to display the error message appropriately
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Center(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ' Confirm Password',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFF42414D)),
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: _confirmPasscontroller,
                            obscureText: passwordObscured,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF4F8FF),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      passwordObscured = !passwordObscured;
                                    },
                                  );
                                },
                                child: Icon(
                                  passwordObscured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.indigo,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.indigo, width: 2),
                                borderRadius: BorderRadius.circular(11),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              FirebaseAuth.instance.signOut();
                              if (passwordConfirmed()) {
                                print("*********************************");
                                print(_emailcontroller.text);
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emailcontroller.text,
                                        password: _passwordcontroller.text);
                                print(FirebaseAuth.instance.currentUser);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavBar()),
                                );
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool("loggedIn", true);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF233C67),
                                minimumSize: const Size(324, 49),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                )),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontFamily: 'poppins', fontSize: 10),
                              ),
                              TextButton(
                                  onPressed: widget.showLogin,
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF2856D7),
                                        fontSize: 10),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
