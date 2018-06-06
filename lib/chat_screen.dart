import 'package:flutter/material.dart';
import './chat_message.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController t1 = new TextEditingController( );
  final List<ChatMessage> messages= <ChatMessage>[];

  Widget _textComposerWidget(){
    return IconTheme(
      data: new IconThemeData(
        color: Colors.red
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            new Flexible(
                child: new TextField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Send a Message',
                      hintStyle: new TextStyle(color: Colors.black26)
                  ),
                  controller: t1,
                  onSubmitted: _handleSubmited,
                ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: ()=> _handleSubmited(t1.text)
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index)=> messages[index],
              itemCount: messages.length,
            )
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }

  void _handleSubmited(String text){
    t1.clear();
    ChatMessage message= new ChatMessage(
      text: text,
    );
    setState(() {
      messages.insert(0, message);
    });
  }
}
