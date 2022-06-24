import 'package:flutter/material.dart';

class ItemKontakWidget extends StatelessWidget {
  const ItemKontakWidget({
    Key? key,
    this.nama,
    this.noTelp,
    this.onTap,
  }) : super(key: key);
  final String? nama;
  final String? noTelp;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap ?? () {},
        title: Text('$nama'),
        subtitle: Text('$noTelp'),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
