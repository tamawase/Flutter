import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  String _textPassFromScreenA;
  ScreenB(this._textPassFromScreenA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen B"),
      ),
      body: Center(
        child: Text("渡されたものは$_textPassFromScreenAです"),
      ),
    );
  }
}
