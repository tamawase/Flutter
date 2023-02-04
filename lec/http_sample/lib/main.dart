import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(
    MaterialApp(
      title: "HTTP Basics",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String pref="";
  String city="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTPの練習"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed:() async{
                Uri url=Uri.parse("https://zipcloud.ibsnet.co.jp/api/search?zipcode=7830060");
                Response res=await get(url);
                var resJson=json.decode(res.body);
                print(resJson["results"][0]["address1"]);
                setState(() {
                  pref=resJson["results"][0]["address1"];
                  city=resJson["results"][0]["address2"];
                });
              },

              child: Text("Fetch"),
            ),
            SizedBox(
              height: 20,
            ),
            Text("都道府県: $pref"),
            Text("市町村: $city"),
          ],
        ),
      ),
    );
  }
}
