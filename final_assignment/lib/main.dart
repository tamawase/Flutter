import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fin/screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      title: "最終課題",
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

  String _action='';

  void _getAction() async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    setState(() {
      _action=_pref.getString('action')??'';
    });
  }

  // void _setAction()async{
  //   SharedPreferences _pref=await SharedPreferences.getInstance();
  //   _pref.setString('action', _action);
  // }

  @override

  void initState() {
    super.initState();
    _getAction();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Memo(),
    );
  }
}

class Memo extends StatefulWidget {
  @override
  State<Memo> createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  // const View({Key? key}) : super(key: key);
  // final String _textFromScreen1='';

  List<String> memoList = [];

  // Memo(this._textFromScreen1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
        // automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF9B003F),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: memoList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    memoList.removeAt(index);
                  });
                },
                background: Container(
                  color: Colors.red,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Container(
                  child: ListTile(
                    title: Center(child: Text(memoList[index])),
                    onLongPress: () {
                      print("プレス");
                      //編集画面を追記（したかったところ）
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.withOpacity(0.5),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 40, right: 20),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF9B003F),
          onPressed: () async {
            final text = await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) {
                  return Screen1();
                },
              ),
            );
            if (text != null) {
              setState(() {
                memoList.add(text);
              });
            }
          },
        ),
      ),
    );
  }
}
