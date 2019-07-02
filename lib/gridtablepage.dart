
import 'package:flutter/material.dart';

class GridTablePage extends StatelessWidget {
  GridTablePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                Container(
                  color: Colors.amber,
                  child: Text('Item 1'),
                ),
                Container(
                  color: Colors.black,
                  child: Text('Item 2'),
                ),
                Container(
                  color: Colors.blue,
                  child: Text('Item 3'),
                ),
                Container(
                  color: Colors.cyan,
                  child: Text('Item 4'),
                ),
                Container(
                  color: Colors.deepOrange,
                  child: Text('Item 5'),
                ),
                Container(
                  color: Colors.red,
                  child: Text('Item 6'),
                ),
                Container(
                  color: Colors.teal,
                  child: Text('Item 7'),
                ),
                Container(
                  color: Colors.white,
                  child: Text('Item 8'),
                ),
                Container(
                  color: Colors.yellow,
                  child: Text('Item 9'),
                ),
                Container(
                  color: Colors.brown,
                  child: Text('Item 10'),
                ),
                Container(
                  color: Colors.green,
                  child: Text('Item 11'),
                ),
                Container(
                  color: Colors.lime,
                  child: Text('Item 12'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Table(
              defaultColumnWidth: FlexColumnWidth(1.0),
              defaultVerticalAlignment: TableCellVerticalAlignment.top,
              children: <TableRow>[
                TableRow(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.amber,
                      child: Text('Item 1'),
                    ),
                    Container(
                      color: Colors.black,
                      child: Text('Item 2'),
                    ),
                    Container(
                      height: 150,
                      color: Colors.blue,
                      child: Text('Item 3'),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.cyan,
                      child: Text('Item 4'),
                    ),
                    Container(
                      color: Colors.deepOrange,
                      child: Text('Item 5'),
                    ),
                    Container(
                      height: 150,
                      color: Colors.red,
                      child: Text('Item 6'),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.teal,
                      child: Text('Item 7'),
                    ),
                    Container(
                      color: Colors.white,
                      child: Text('Item 8'),
                    ),
                    Container(
                      height: 150,
                      color: Colors.yellow,
                      child: Text('Item 9'),
                    ),
                  ]
                ),
              ],
              ),
          ),
        ],
      ),
    );
  }
}