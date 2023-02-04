import 'package:flutter/material.dart';
import 'package:multi_screen/Screens/screen_1.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Navi',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画面1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("Button Aが押されたよ");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ScreenA();
                },
              ),
            );
          },
          child: Text('Button A'),
        ),
      ),
    );
  }
}
