import 'package:flutter/material.dart';

class ItemFormWidget extends StatelessWidget {
  const ItemFormWidget({
    Key? key,
    this.label,
    required this.controller,
  }) : super(key: key);
  final String? label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: '$label',
          hintText: 'Masukkan $label',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
