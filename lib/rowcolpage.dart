import 'package:flutter/material.dart';

class RowColPage extends StatelessWidget {
  RowColPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Column Page'),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.teal,
          child: Text('Row 1'),),
        Expanded(
          child: Container(
            color: Colors.red,
            child: Text('Row 2'))
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              color: Colors.orange,
              child: Text('Row 3'))
          )
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.yellow,
            child: Center(
              child: Text('Row 4'))
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
            color: Colors.purple,
            child: Text('1'),),
          Container(
            color: Colors.blue,
            child: Text('2'),
          ),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Text('1'),
              ),
            ),
          ],
        )
      ],
      ),
    );
  }
}