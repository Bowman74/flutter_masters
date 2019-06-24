import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
  final int passedValue = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop(passedValue + 1);
            return false;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('second page'),
              FlatButton(
                child: Text('Go Back'),
                onPressed: () {
                  Navigator.of(context).pop(passedValue + 1);
                  }
                ),
              Hero(
                tag: 'count',
                child:Text(passedValue.toString()),
                flightShuttleBuilder: (BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext) {
                    final Hero toHero = toHeroContext.widget;
                    return RotationTransition(
                      turns: animation,
                      child: toHero.child,
                    );
                  }
              ),
            ],
          ),
        ),
      )
    );
  }
}