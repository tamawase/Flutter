import 'package:asyncproj/screens/screen2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("To Screen 2"),
              onPressed: () async {
                String data = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Screen2();
                  }),
                );
                print("戻ってきた文字列が: $data");
              },
            ),
            Hero(
              child: Image.asset("images/logo_hum.webp"),
              tag: "waseda",
            ),
          ],
        ),
      ),
    );
  }
}
