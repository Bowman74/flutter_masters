
import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  FuturePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  FuturePageState createState() => FuturePageState();
}

class FuturePageState extends State<FuturePage> {

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
                ),
              ),
              FlatButton(
                child: 
                  Text('Run Future'),
                onPressed: () {
                  int a = 1;
                  Future(() {
                    debugPrint(a.toString());
                  });
                  a++;
                },
              )
            ]
          ),
        )
      );
  }
}