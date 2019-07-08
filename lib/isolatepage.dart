import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  IsolatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  IsolatePageState createState() => IsolatePageState();
}

class IsolatePageState extends State<IsolatePage> {
  static int currentCount = 1;

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
                  await Isolate.spawn<int>(longRunningTask, currentCount);

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

  static Future<int> longRunningTask(int countParameter) async {
    var a = 0;
    for (var i = 0; i < 100000; i++) {
      a ++;
    }
    debugPrint(a.toString());
    currentCount++;
    debugPrint(currentCount.toString());
    debugPrint(countParameter.toString());
    return countParameter;
  }
}