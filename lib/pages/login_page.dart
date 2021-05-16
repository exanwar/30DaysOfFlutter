import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness:
            (MediaQuery.of(context).platformBrightness == Brightness.dark)
                ? Brightness.light
                : Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Text('Login Page',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
