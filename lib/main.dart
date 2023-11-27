import 'dart:developer';

import 'package:chatapp/auth/Signup.dart';
import 'package:chatapp/firebase_options.dart';

import 'package:chatapp/screens/chatbubble.dart';
import 'package:chatapp/screens/introscreen.dart';
import 'package:chatapp/auth/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Chatapp());
}

class Chatapp extends StatefulWidget {
  const Chatapp({super.key});

  @override
  State<Chatapp> createState() => _ChatappState();
}

class _ChatappState extends State<Chatapp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Loginscreen.id: (context) => Loginscreen(),
        Signupscreen.id: (context) => Signupscreen(),
        chatbubble.id: (context) => chatbubble(),
      },
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser == null)
          ? const Introscreen()
          : chatbubble(),
    );
  }
}
