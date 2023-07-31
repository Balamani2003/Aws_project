import 'package:aws_project/screens/confrim.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import './screens/entry.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),

      onGenerateRoute: (setings){
        if(setings.name=="/confirm"){
          return PageRouteBuilder(pageBuilder:(_,__,___) =>ConfirmScreen(data: setings.arguments as LoginData),
              transitionsBuilder:(_,__,___,child)=>child,
        );
        }
        return MaterialPageRoute(builder:(_)=> EntryScreen());
      },
    );
  }
}


