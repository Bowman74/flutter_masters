
import 'package:flutter/material.dart';

import 'classes/messageservice.dart';

class MessageQueuePage extends StatefulWidget {
  MessageQueuePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MessageQueuePageState createState() => MessageQueuePageState();
}

class MessageQueuePageState extends State<MessageQueuePage> {
  final MessageService _messageService = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: FlatButton(
                    child: 
                      Text('Send Message'),
                    onPressed: () {
                      var message = Message('incrementCounter', null);
                      _messageService.publish(message);
                    },
                  ),
                ),
              ),
            ]
          ),
        )
      );
  }
}