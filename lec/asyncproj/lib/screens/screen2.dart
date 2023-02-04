import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      body: Center(
        child: Row(
          children: [
            Hero(
              child: Image.asset(
                "images/logo_hum.webp",
                height: 40,
              ),
              tag: "waseda",
            ),
            ElevatedButton(
              child: Text("Screen 1へ戻る"),
              onPressed: (){
                Navigator.pop(context,"Popで画面2から戻りますよー");
              },
            ),
          ],
        ),
      ),
    );
  }
}
