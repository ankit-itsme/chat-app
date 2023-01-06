import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'rounded_button.dart';
import 'constants.dart';
import 'login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static String id = 'signup_screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String? passwordFirst;
  bool showSpinner = false;
  bool emailRepeat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Image.asset('assets/chatApp.png'),
                  height: 200,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Email'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    passwordFirst = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Password'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Confirm Your Password'),
                ),
                SizedBox(
                  height: 30,
                ),
                RoundedButton(
                    title: 'Sign up',
                    color: Colors.lightBlueAccent,
                    onpress: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      if (passwordFirst == password) {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email!, password: password!);
                          if (newUser != null) {
                            Navigator.pushNamed(context, LoginScreen.id);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (signUpError) {
                            if (signUpError ==
                            'firebase_auth/email-already-in-use')
                              setState(() {
                                showSpinner = false;
                              });
                              setState(() {
                                emailRepeat= true;
                              });
                            }
                          }
                        else {
                        Navigator.pushNamed(context, SignupScreen.id);
                      }
                    }
                    ),
          (emailRepeat == true)
          ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Warning!'),
                content: const Text('Your email is registered \n  click on next button to SignUp with different Number'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('LOGIN'),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                  TextButton(
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ) : SizedBox(height: 0,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}