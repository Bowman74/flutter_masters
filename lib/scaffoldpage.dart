
import 'package:flutter/material.dart';

class ScaffoldPage extends StatelessWidget {
  ScaffoldPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top AppBar'),
      ),
      body: Center(
        child: Text('The body of the page'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text('The bottom navigation bar'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment Counter',
        child: Icon(Icons.add), onPressed: () {},
      ),
      drawer: Drawer( child: Text('end Drawer')),
      endDrawer: Drawer( child: Text('end Drawer')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      persistentFooterButtons: <Widget>[Text('fooo'), Text('bar')],
    );
  }
}