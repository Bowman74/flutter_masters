
import 'package:flutter/material.dart';

class FlowPage extends StatefulWidget {
  FlowPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlowPageState createState() => _FlowPageState(title: title);
}

class _FlowPageState extends State<FlowPage> with SingleTickerProviderStateMixin {
  _FlowPageState({this.title});

  final String title;
  AnimationController myAnimation;

  @override void initState() {
    super.initState();
    myAnimation = AnimationController(
      lowerBound: 1,
      upperBound: 10,
      duration: Duration(seconds: 2),
      vsync: this,
    );
  }

  Widget createChild(BuildContext context, String title, Color color) {
    return GestureDetector(
      onTap: () {
        myAnimation.reverse();
      },
      onDoubleTap: () {
        myAnimation.forward();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        color: color,
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Flow(
        delegate: CustomFlowDelegate(myAnimation : myAnimation),
        children: <Widget>[
          createChild(context, 'Item 1', Colors.amber),
          createChild(context, 'Item 2', Colors.black),
          createChild(context, 'Item 3', Colors.blue),
          createChild(context, 'Item 4', Colors.cyan),
          createChild(context, 'Item 5', Colors.deepOrange),
          createChild(context, 'Item 6', Colors.red),         
          ],
        ),
    );
  }
}

class CustomFlowDelegate extends FlowDelegate {
  CustomFlowDelegate({this.myAnimation}) : super(repaint: myAnimation);

  final Animation<double> myAnimation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dy = context.getChildSize(i).height * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          0,
          dy * 0.1 * myAnimation.value,
          0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CustomFlowDelegate oldDelegate) {
    return myAnimation != oldDelegate.myAnimation;
  }
}