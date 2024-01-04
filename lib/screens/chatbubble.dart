import 'dart:developer';

import 'package:chatapp/auth/loginscreen.dart';
import 'package:chatapp/components/chatbubblecatgory.dart';
import 'package:chatapp/models/messagesmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class chatbubble extends StatelessWidget {
  chatbubble({super.key});
  static String id = "chatbubble";
  TextEditingController texteditingController = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  ScrollController scrollcontroller = ScrollController();
  String? data;
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy("timecreated", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messagesmodel> messageslist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            var data = Messagesmodel.fromjson(snapshot.data!.docs[i]);
            messageslist.add(data);
          }
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.pink.shade400,
                centerTitle: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/image/logo.png",
                      width: 55,
                      height: 55,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Chatty",
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () async {
                      GoogleSignIn googleSignIn = GoogleSignIn();

                      googleSignIn.disconnect();
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, Loginscreen.id, (route) => false);
                    },
                  )
                ]),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollcontroller,
                    itemCount: messageslist.length,
                    itemBuilder: (context, index) {
                      return email == messageslist[index].id
                          ? Chatbublecatgory(messagesmodel: messageslist[index])
                          : Chatbublecatgorysecond(
                              messagesmodel: messageslist[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: texteditingController,
                    onSubmitted: (value) {
                      data = value;

                      log(email.toString()!);
                    },
                    decoration: InputDecoration(
                        hintText: "Send message",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await messages.add({
                                "messages": data,
                                "timecreated": DateTime.now(),
                                "id": email,
                              });
                              texteditingController.clear();
                              data = "";
                              scrollcontroller.animateTo(
                                0,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 200),
                              );
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.black,
                            ))),
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("obs there is an error try later!!"),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.pink.shade400,
              ),
            ),
          );
        }
      },
    );
  }
}
