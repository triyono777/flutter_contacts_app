import 'package:flutter/material.dart';

class TambahKontakScreen extends StatefulWidget {
  const TambahKontakScreen({Key? key}) : super(key: key);

  @override
  State<TambahKontakScreen> createState() => _TambahKontakScreenState();
}

class _TambahKontakScreenState extends State<TambahKontakScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah kontak'),
      ),
      body: Text('body'),
    );
  }
}
