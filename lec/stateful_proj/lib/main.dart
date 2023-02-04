import 'package:flutter/material.dart';

int _counter = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = "何かが表示されます";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Stateful Widget"),
        ),
        body: Column(
          children: [
            Text(msg),
            ElevatedButton(
              onPressed: _onClick,
              child: Text("ボタン"),
            ),
            Divider(
              thickness: 10.0,
            ),
            GestureDetector(
              child: Text(
                "これがボタンの代わりになります",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.red,
                  decoration: TextDecoration.overline,
                  decorationColor: Colors.green,
                ),
              ),
              onTap: _onClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onClick() {
    print("メソッドで押されました");
    setState(() {
      msg = "ボタンが押されました $_counter";
      _counter++;
      print(msg);
    });
  }
}
