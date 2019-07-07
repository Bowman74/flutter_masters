import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  IsolatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  IsolatePageState createState() => IsolatePageState();
}

class IsolatePageState extends State<IsolatePage> {
  static int currentCount = 0;

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
                  child: Text(currentCount.toString()),
                ),
              ),
              FlatButton(
                child: 
                  Text('Start Isolate'),
                onPressed: () {
                  var myPort = ReceivePort();
                  Isolate.spawn(longRunningTask, myPort.sendPort);

                  setState(() {
                    currentCount = currentCount;
                  });
                },
              )
            ]
          ),
        )
      );
  }

  static void longRunningTask(SendPort sendPort) async {
    var a = 0;
    for (var i = 0; i < 100000; i++) {
      a ++;
    }
    debugPrint(a.toString());
    currentCount++;
    debugPrint(currentCount.toString());
  }
}