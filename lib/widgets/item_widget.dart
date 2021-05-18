import 'package:flutter/material.dart';
import 'package:mtechviral/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Card(
        child: ListTile(
          onTap: () {
            print('${item.name}');
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Text(
            '\$${item.price.toString()}',
            textScaleFactor: 1.5,
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
