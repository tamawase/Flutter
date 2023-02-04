import 'package:fin/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String _inputText = '';
  String? _alertText = '';
  // final  _prefs = SharedPreferences.getInstance();
  // late Future<String> _action;
  String _action='';

  void _getAction() async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    setState(() {
      _action=_pref.getString('action')??'';
    });
  }

  void _setAction()async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    _pref.setString('action', _action);
  }

  // void _removeAction()async{
  //   SharedPreferences _pref=await SharedPreferences.getInstance();
  //   setState(() {
  //     _action='';
  //     _pref.remove('action');
  //   });
  // }


  @override

  void initState() {
    super.initState();
    _getAction();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メモ"),
        backgroundColor: Color(0xFF9B003F),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "メモを入力",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _inputText = value;
                      _setAction();
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_inputText != '') {
                        Navigator.of(context).pop(_inputText);
                        MaterialPageRoute(builder: (context) {
                          return Memo();
                        });
                      } else {
                        showDialog(context: context, builder: (_){
                          return Alert2();
                        });
                      }
                    },
                    child: Text("テキストを保存"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF9B003F)),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      // Navigator.pop(context);
                      _alertText = await showDialog<String>(
                          context: context,
                          builder: (_) {
                            return Alert();
                          });
                      if (_alertText == 'T') {
                        Navigator.pop(context);
                      }
                    },
                    child: Text("キャンセル"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF9B003F)),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Alert extends StatelessWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("本当に戻りますか？"),
      content: Text("入力された内容は失われます"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "No",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0x220055FF))),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'T');

            // Navigator.pop(context);
            // Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Text(
            "Yes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(
            side: BorderSide(color: Color(0x220055FF), width: 3),
          ),
        ),
      ],
    );
  }
}

class Alert2 extends StatelessWidget {
  const Alert2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("何も入力されていません"),
      content: Text("テキストを保存することができません"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
