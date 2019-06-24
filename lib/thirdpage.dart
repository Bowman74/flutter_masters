import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            title: Text(widget.title),
            backgroundColor: Colors.blue,
            expandedHeight: 50.0),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Material(
                  child: ListTile(
                      title: Text('first item'),
                      subtitle: Text('first item detail'))),
              Material(
                  child: ListTile(
                      title: Text('second item'),
                      subtitle: Text('second item detail'))),
              Material(
                  child: ListTile(
                      title: Text('third item'),
                      subtitle: Text('third item detail'))),
              Material(
                  child: ListTile(
                      title: Text('fourth item'),
                      subtitle: Text('fourth item detail'))),
              Material(
                  child: ListTile(
                      title: Text('fifth item'),
                      subtitle: Text('fifth item detail'))),
              Material(
                  child: ListTile(
                      title: Text('sixth item'),
                      subtitle: Text('sixth item detail'))),
              Material(
                  child: ListTile(
                      title: Text('seventh item'),
                      subtitle: Text('seventh item detail'))),
            ],
          ),
        ),
      ],
    );
  }
}
