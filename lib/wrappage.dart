import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  WrapPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        spacing: 5,
        runSpacing: 10,
        children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                  child: Text('Item 1'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  child: Text('Item 2'),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                  child: Text('Item 3'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.cyan,
                  child: Text('Item 4'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.deepOrange,
                  child: Text('Item 5'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Text('Item 6'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.teal,
                  child: Text('Item 7'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                  child: Text('Item 8'),
                ),
                Container(
                  width: 100,
                  height: 100,                  
                  color: Colors.yellow,
                  child: Text('Item 9'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.brown,
                  child: Text('Item 10'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: Text('Item 11'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.lime,
                  child: Text('Item 12'),
                )          
          ],
        ),
    );
  }
}