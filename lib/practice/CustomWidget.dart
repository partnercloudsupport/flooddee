import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Custom Button Demo"),
        ),
        body: Center(
          child: CustomButton("Custom Rasied Button"),
        ),
      ),
    );
  }

}
