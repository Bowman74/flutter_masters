import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  StackPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Column Page'),
      ),
      body: Column(children: <Widget>[ 
        Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              color: Colors.teal,
              child: Text('Item 1'),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 100,
              width: 100,
              color: Colors.deepPurple,
              child: Text('Item 2'),
            ),
            Positioned(
              left: 50,
              top: 10,
              child: Container(
                color: Colors.red,
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: Text('Item 3'),
              ),
            ),
        ],),
        IndexedStack(
          index: 0,
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              color: Colors.teal,
              child: Text('Item 1'),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 100,
              width: 100,
              color: Colors.deepPurple,
              child: Text('Item 2'),
            ),
            Positioned(
              left: 50,
              top: 10,
              child: Container(
                color: Colors.red,
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: Text('Item 3'),
            ),
          ),
        ],),
      ],)
    );
  }
}