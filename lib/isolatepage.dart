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
                onPressed: () async {
                  var myPort = ReceivePort();
                  Isolate.spawn<IsolateParameter>(longRunningTask, IsolateParameter(myPort.sendPort, currentCount));

                  currentCount = await myPort.first;
                  setState(() {});
                },
              )
            ]
          ),
        )
      );
  }

  static void longRunningTask(IsolateParameter parameter) async {
    var a = 0;
    for (var i = 0; i < 100000; i++) {
      a ++;
    }
    var currentCount = parameter.currentValue;

    parameter.sendPort.send(++currentCount);
  }
}

class IsolateParameter {
  final SendPort _myPort;
  final int _currentValue;
  IsolateParameter(this._myPort, this._currentValue);

  SendPort get sendPort => this._myPort;

  int get currentValue => this._currentValue;
}