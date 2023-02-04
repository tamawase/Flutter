import 'package:flutter/material.dart';
import 'package:multi_screen/Screens/screen_2.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  String _inputText = "hoge";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen A'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value){
                setState(() {
                  _inputText = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Mainに戻ります'),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ScreenB(_inputText);
              }));
            },
            child: Text('Button Bに移動します'),
          ),
          Text(_inputText),
        ],
      ),
    );
  }
}
