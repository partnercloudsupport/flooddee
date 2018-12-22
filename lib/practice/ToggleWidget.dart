import 'package:flutter/material.dart';

void main() => runApp(ToggleWidgets());

class ToggleWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ToggleWidgetsPage(),
    );
  }
}

class ToggleWidgetsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ToggleWidgetsState();
}

class ToggleWidgetsState extends State<ToggleWidgetsPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return Text("Toggle One");
    } else {
      return MaterialButton(
        onPressed: () {},
        child: Text("Toggle Two"),
        color: Colors.blue,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggle Widgets Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: "Update Text",
        child: Icon(Icons.update),
      ),
    );
  }
}
