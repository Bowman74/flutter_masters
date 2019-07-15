import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masters/simplestate.dart';

import 'ephemeralstatepage.dart';
import 'inheritedwidgetstate.dart';

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
        '/EphemeralStatePage': (BuildContext context) =>
            EphemeralStatePage(title: 'Ephemeral State Page'),
        '/SimpleStatePage': (BuildContext context) =>
            SimpleStatePage(title: 'Simple State Page'),
        '/InheritedWidgetPage': (BuildContext context) =>
            InheritedWidgetPage(title: 'Inherited Widget Page'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
            ListTile(title: Text('Ephemeral State Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/EphemeralStatePage');
            }),
            ListTile(title: Text('Simple State Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/SimpleStatePage');
            }),
            ListTile(title: Text('Inherited Widget Page'), onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed('/InheritedWidgetPage');
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
