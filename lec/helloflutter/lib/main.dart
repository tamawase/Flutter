import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text("Container 1"),
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                    margin: EdgeInsets.only(left: 20.0, top: 20.0),
                  ),
                  Container(
                    child: Text("Container 2"),
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    margin: EdgeInsets.only(top: 20.0),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Container 3"),
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    margin: EdgeInsets.only(left: 20.0),
                  ),
                  Container(
                    child: Text("Container 4"),
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
