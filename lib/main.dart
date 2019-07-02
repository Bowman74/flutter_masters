import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masters/fourthpage.dart';
import 'package:flutter_masters/gridtablepage.dart';
import 'package:flutter_masters/rowcolpage.dart';
import 'package:flutter_masters/scaffoldpage.dart';
import 'package:flutter_masters/secondpage.dart';
import 'package:flutter_masters/stackpage.dart';
import 'package:flutter_masters/thirdpage.dart';
import 'package:flutter_masters/wrappage.dart';

import 'ListViewPage.dart';
import 'flowpage.dart';

void main() {
  debugPaintSizeEnabled=false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/SecondPage': (BuildContext context) =>
            SecondPage(title: 'Second Page'),
        '/ThirdPage': (BuildContext context) => ThirdPage(title: 'Third Page'),
        '/FourthPage': (BuildContext context) =>
            FourthPage(title: 'Fourth Page'),
        '/ScaffoldPage': (BuildContext context) =>
            ScaffoldPage(title: 'Scaffold Page'),
        '/RowColPage': (BuildContext context) =>
            RowColPage(title: 'RowColPage Page'),
        '/StackPage': (BuildContext context) =>
            StackPage(title: 'StackPage Page'),
        '/GridTablePage': (BuildContext context) =>
            GridTablePage(title: 'Grid Table Page'),
        '/FlowPage': (BuildContext context) =>
            FlowPage(title: 'Flow Page'),
        '/ListViewPage': (BuildContext context) =>
            ListViewPage(title: 'ListView Page'),
        '/WrapPage': (BuildContext context) =>
            WrapPage(title: 'Wrap Page'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(color: Colors.blue,
              child: new DrawerHeader(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Sample app!', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                ),
              ),
            ),
            ListTile(title: Text('Second Page'), onTap: () async {
              Navigator.pop(context);
              var result = await Navigator.of(context)
                  .pushNamed('/SecondPage', arguments: _counter);
              setState(() {
                _counter = result;
              });
            }),
            ListTile(title: Text('Third Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/ThirdPage');
            }),
            ListTile(title: Text('Fourth Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/FourthPage');
            }),
            ListTile(title: Text('Scaffold Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/ScaffoldPage');
            }),
            ListTile(title: Text('Row Column Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/RowColPage');
            }),
            ListTile(title: Text('Stack Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/StackPage');
            }),
            ListTile(title: Text('Grid Table Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/GridTablePage');
            }), 
            ListTile(title: Text('Flow Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/FlowPage');
            }),
            ListTile(title: Text('ListView Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/ListViewPage');
            }),
            ListTile(title: Text('Wrap Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/WrapPage');
            }),
          ]
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Hero(
                tag: 'count',
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                flightShuttleBuilder: (BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext) {
                  final Hero toHero = toHeroContext.widget;
                  final Animation<double> curvedAnimation = new CurvedAnimation(
                    parent: _controller,
                    curve: new Interval(
                      0.2,
                      0.8,
                      curve: Curves.slowMiddle,
                    ),
                    reverseCurve: new Interval(
                      0.2,
                      0.8,
                      curve: Curves.slowMiddle,
                    ),
                  );
                  return RotationTransition(
                    turns: curvedAnimation,
                    child: toHero.child,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
