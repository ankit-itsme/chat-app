import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;


class ChatScreen extends StatefulWidget {
   ChatScreen({required this.email}) ;

  static String id = 'chat_screen';
  String email;

  @override
  State<ChatScreen> createState() => _ChatScreenState(email: email);
}

class _ChatScreenState extends State<ChatScreen> {
  _ChatScreenState({required this.email});
  final _auth = FirebaseAuth.instance;
  String? email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


      print('&&&&&&&&&&&&');
      print(email);
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
          },
        ),],
        title: Text('Chat'),
      ),
      body: Text(
        'type your messege...',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
