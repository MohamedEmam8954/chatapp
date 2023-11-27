import 'package:chatapp/models/messagesmodel.dart';
import 'package:flutter/material.dart';

class Chatbublecatgory extends StatelessWidget {
  const Chatbublecatgory({super.key, required this.messagesmodel});
  final Messagesmodel messagesmodel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0xffec407a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Text(
          messagesmodel.messages,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class Chatbublecatgorysecond extends StatelessWidget {
  const Chatbublecatgorysecond({super.key, required this.messagesmodel});
  final Messagesmodel messagesmodel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0xffec407a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Text(
          messagesmodel.messages,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
