import 'package:flutter/material.dart';
import 'package:mtechviral/models/catalog.dart';
import 'package:mtechviral/widgets/drawer.dart';
import 'package:mtechviral/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
            brightness:
                (MediaQuery.of(context).platformBrightness == Brightness.dark)
                    ? Brightness.light
                    : null,
            title: Text('Catalog App')),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ));
  }
}
