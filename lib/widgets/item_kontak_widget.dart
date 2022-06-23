import 'package:flutter/material.dart';

class ItemKontakWidget extends StatelessWidget {
  const ItemKontakWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Nama'),
        subtitle: Text('08000000'),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
