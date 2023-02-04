import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack練習"),
        ),
        body: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),

          ],
        ),
      ),
    );
  }
}

