
import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({Key key, this.title}) : super(key: key);

  final String title;
  final List<ListItem> items = <ListItem>[
    ListItem(Colors.amber, 'Item 1'), 
    ListItem(Colors.black, 'Item 2'), 
    ListItem(Colors.blue, 'Item 3'), 
    ListItem(Colors.cyan, 'Item 4'), 
    ListItem(Colors.deepOrange, 'Item 5'), 
    ListItem(Colors.red, 'Item 6'), 
    ListItem(Colors.teal, 'Item 7'), 
    ListItem(Colors.white, 'Item 8'), 
    ListItem(Colors.purple, 'Item 9')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: (40 * (index + 1)).toDouble(),
            color: items[index].itemColor,
            child: Text(items[index].description)
          );
        },
      ),
    );
  }
}

class ListItem {
  ListItem(Color color, String description) {
    this.itemColor = color;
    this.description = description;
  }

  Color itemColor;
  String description;
}