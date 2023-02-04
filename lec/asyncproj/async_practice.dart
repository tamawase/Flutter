import 'dart:io';

void main(){
  doSomeTasks();
}

void doSomeTasks() async{
  task1();
  var res= await task2();
  task3(res);
}

void task1(){
  print("Task1");
}

Future<String> task2() async{
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);
  String result="";
  await Future.delayed(threeSeconds,(){
    result="Task2のデータが非同期で実行されました";
    print("Task2");
  });


  return result;
}

void task3(String prevResult){
  print("Task3$prevResult です");
}