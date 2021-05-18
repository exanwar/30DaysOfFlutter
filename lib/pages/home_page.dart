import 'package:flutter/material.dart';
import 'package:mtechviral/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            brightness:
                (MediaQuery.of(context).platformBrightness == Brightness.dark)
                    ? Brightness.light
                    : null,
            title: Text('Catalog App')),
        body: Center(
          child: Container(
            child: Text('Welcome to $days days of flutter by $name'),
          ),
        ),
        drawer: MyDrawer());
  }

  // ! Methods

  bringVagetables() {
    //without any parameter
  }

  bringVagetables2(int rupies) {
    //with parameter that is required
  }

  bringVagetables3({int rupies}) {
    //with parameter that is optional
  }

  bringVagetables4({int rupies = 50, bool isThalia = false}) {
    //with parameter that is optional with pre defined values
  }

  bringVagetables5({int rrupies = 50, @required bool isThalia}) {
    //with parameter that is optional with pre defined values and one is required to give when call
  }
}
