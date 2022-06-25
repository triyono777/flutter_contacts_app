import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/data/firebase_controller.dart';

import '../data/data_kontak.dart';
import '../widgets/item_form_widget.dart';

class TambahKontakScreen extends StatefulWidget {
  const TambahKontakScreen({Key? key}) : super(key: key);

  @override
  State<TambahKontakScreen> createState() => _TambahKontakScreenState();
}

class _TambahKontakScreenState extends State<TambahKontakScreen> {
  TextEditingController namaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah kontak'),
      ),
      body: Column(
        children: [
          ItemFormWidget(controller: namaController, label: 'Nama'),
          ItemFormWidget(
            controller: noTelpController,
            label: 'Nomor Telepon',
          ),
          ItemFormWidget(
            controller: alamatController,
            label: 'Alamat',
          ),
          ElevatedButton(
            onPressed: () {
              // dataKontak.add({
              //   "id": Random().nextInt(100).toString(),
              //   "nama": namaController.text,
              //   "nomor_telp": noTelpController.text,
              //   "alamat": alamatController.text,
              // });
              // print(dataKontak.toList());
              FirebaseController().addUser({
                "nama": namaController.text,
                "nomor_telp": noTelpController.text,
                "alamat": alamatController.text,
              });
              Navigator.pop(context, true);
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
