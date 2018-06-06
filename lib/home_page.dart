import 'package:flutter/material.dart';
import './chat_screen.dart';
class ChatWin extends StatefulWidget {
  @override
  _ChatWinState createState() => new _ChatWinState();
}

class _ChatWinState extends State<ChatWin> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center( child: new Text('Frens Chat',style: new TextStyle(color: Colors.red),)),
        backgroundColor: Colors.black54,

      ),
      body: new ChatScreen(),

    );
  }
}
