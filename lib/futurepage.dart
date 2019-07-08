
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:convert';

class FuturePage extends StatefulWidget {
  FuturePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  FuturePageState createState() => FuturePageState();
}

class FuturePageState extends State<FuturePage> {
  String apiJson = '';

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
                  child: Text(apiJson)
                ),
              ),
              FlatButton(
                child: 
                  Text('async future'),
                onPressed: () async {
                  int a = 1;
                  await Future(() {
                    debugPrint(a.toString());
                  });
                  a++;
                },
              ),
              FlatButton(
                child: 
                  Text('then future'),
                onPressed: () {
                  int a = 1;
                  Future(() {
                    debugPrint(a.toString());
                  }).then((_) {
                    a++;
                  });
                },
              ),
              FlatButton(
                child: 
                  Text('async API call'),
                onPressed: () async {
                  var result = await getCatInfo();
                  setState(() {
                    apiJson = result;
                  });
                },
              ),
            ]
          ),
        )
      );
  }

  Future<String> getCatInfo() async {
    String returnValue = '';
    var httpClient = new HttpClient();
    var uri = new Uri.https('cat-fact.herokuapp.com', '/facts');
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == 200) {
      returnValue = await response.transform(utf8.decoder).join();
    }
    return returnValue;
  }
}