import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
class ConfirmScreen extends StatefulWidget {
  final LoginData data;
  const ConfirmScreen({super.key,required this.data});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text("confirm"),
      ),
    );
  }
}
