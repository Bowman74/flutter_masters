import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  FourthPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  FourthPageState createState() => FourthPageState();
}

class FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Builder(
            // Create an inner BuildContext so that the onPressed methods
            // can refer to the Scaffold with Scaffold.of().
            builder: (BuildContext builderContext) {
          return GestureDetector(
            onTapDown: (e) {
              Scaffold.of(builderContext).showSnackBar(new SnackBar(
                content: new Text("tap down"),
                duration: Duration(milliseconds: 250),
              ));
            },
            onLongPress: () {
              Scaffold.of(builderContext).showSnackBar(new SnackBar(
                content: new Text("long press"),
                duration: Duration(milliseconds: 250),
              ));
            },
            onTap: () {
              Scaffold.of(builderContext).showSnackBar(new SnackBar(
                content: new Text("tap"),
                duration: Duration(milliseconds: 250),
              ));
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text('gesture only'),
                    ),
                  ),
                  Listener(
                    onPointerDown: (e) {
                      Scaffold.of(builderContext).showSnackBar(new SnackBar(
                        content: new Text("ponter down"),
                        duration: Duration(milliseconds: 250),
                      ));
                    },
                    onPointerUp: (e) {
                      Scaffold.of(builderContext).showSnackBar(new SnackBar(
                        content: new Text("ponter up"),
                        duration: Duration(milliseconds: 250),
                      ));
                    },
                    child: Text(
                      'pointer and gesture area',
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('gesture only'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
