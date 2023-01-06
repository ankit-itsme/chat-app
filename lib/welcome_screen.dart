import 'package:chat_app/login_screen.dart';
import 'package:chat_app/rounded_button.dart';
import 'package:chat_app/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  child: Image.asset('assets/chatApp.png'),
                  height: 80,
                ),
                Text(
                  'Open Chat',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            RoundedButton(
              title: 'Login',
              color: Colors.blueAccent,
              onpress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Click below if you are new user!',
              style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:Colors.black45 ),
            ),
            RoundedButton(
              title: 'Sign up',
              color: Colors.lightBlueAccent,
              onpress: () {
                Navigator.pushNamed(context, SignupScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
