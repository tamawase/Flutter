import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('外部パッケージの利用'),
        ),
        body: Center(
          child: Text(nouns[Random().nextInt(nouns.length)]),
        ),
      ),
    );
  }
}
