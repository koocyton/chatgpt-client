import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {

  const ChatPage({Key? key,}) : super(key: key) ;

  @override
  ChatPageState createState() {
    return ChatPageState();
  }
}
 
class ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(color: Colors.green,)),
        Container(height: 300, color: Colors.amber,)
      ],
    );
  }

}