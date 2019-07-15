
import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

class EphemeralStatePage extends StatefulWidget {
  EphemeralStatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  EphemeralStatePageState createState() => EphemeralStatePageState();
}

class EphemeralStatePageState extends State<EphemeralStatePage> {

  @override
  Widget build(BuildContext context) {
    var mainPageState = Random().nextInt(100);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SomeStatelessWidget(),
                      SomeStatefulWidget(),
                      ParamterStatefulWidget(mainPageState),
                      Text('Main page state: ' + mainPageState.toString()),
                    ],
                    )
                ),
              ),
              FlatButton(
                child: 
                  Text('Refresh'),
                onPressed: () {
                  setState(() {});
                },
              ),
            ]
          ),
        )
      );
  }
}

class SomeStatelessWidget extends StatelessWidget {

  final int someInfo = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    return Text('Stateless widget: ' + someInfo.toString());
  }
}

class SomeStatefulWidget extends StatefulWidget {

  @override
  SomeStatefulWidgetState createState() {
    return SomeStatefulWidgetState();
  }
}

class SomeStatefulWidgetState extends State<SomeStatefulWidget> {
  final int someInfo = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    return Text('Stateful widget own state: ' + someInfo.toString());
  }
}

class ParamterStatefulWidget extends StatefulWidget {
  ParamterStatefulWidget(this.parameter1);

  final int parameter1;

  @override
  ParamterStatefulWidgetState createState() {
    return ParamterStatefulWidgetState(parameter1);
  }
}

class ParamterStatefulWidgetState extends State<ParamterStatefulWidget> {
  ParamterStatefulWidgetState(this._paramter);

  int _paramter;

  @override
  Widget build(BuildContext context) {
    return Text('Stateful widget passed state: ' + _paramter.toString() + ' widget state: ' + this.widget.parameter1.toString());
  }
}