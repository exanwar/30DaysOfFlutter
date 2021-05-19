import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtechviral/models/catalog.dart';
import 'package:mtechviral/widgets/drawer.dart';
import 'package:mtechviral/widgets/item_widget.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Logger logger = Logger();
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          brightness:
              (MediaQuery.of(context).platformBrightness == Brightness.dark)
                  ? Brightness.light
                  : null,
          title: Text('Catalog App')),
      drawer: MyDrawer(),
      // body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
      //     ? ListView.builder(
      //         itemCount: CatalogModel.items.length,
      //         itemBuilder: (context, index) {
      //           return ItemWidget(
      //             item: CatalogModel.items[index],
      //           );
      //         },
      //       )
      //     : Center(
      //         child: CircularProgressIndicator(),
      //
      //     )
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16),
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.deepPurple),
                        ),
                        child: Image.network(item.image),
                        footer: Text(item.price.toString()),
                      ));
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
