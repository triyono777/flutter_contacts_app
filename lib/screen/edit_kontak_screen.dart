import 'package:flutter/material.dart';

import '../data/data_kontak.dart';
import '../widgets/item_form_widget.dart';

class EditKontakScreen extends StatefulWidget {
  const EditKontakScreen(
      {Key? key,
      required this.nama,
      required this.noTelp,
      required this.alamat,
      required this.id})
      : super(key: key);
  final String nama;
  final String noTelp;
  final String alamat;
  final String id;

  @override
  State<EditKontakScreen> createState() => _EditKontakScreenState();
}

class _EditKontakScreenState extends State<EditKontakScreen> {
  TextEditingController namaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  @override
  void initState() {
    print(widget.id);
    namaController.text = widget.nama;
    noTelpController.text = widget.noTelp;
    alamatController.text = widget.alamat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.nama;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah kontak'),
        actions: [
          IconButton(
              onPressed: () {
                dataKontak.removeWhere((element) => element["id"] == widget.id);
                Navigator.pop(context, true);
              },
              icon: Icon(Icons.delete))
        ],
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
              dataKontak.where((element) {
                if (element["id"] == widget.id) {
                  element["nama"] = namaController.text;
                  element["nomor_telp"] = noTelpController.text;
                  element["alamat"] = alamatController.text;
                  return element;
                }
                return element;
              }).toList();
              // dataKontak.remove();
              // dataKontak. ({
              //   "nama": namaController.text,
              //   "nomor_telp": noTelpController.text,
              //   "alamat": alamatController.text,
              // });
              print(dataKontak.toList());
              Navigator.pop(context, true);
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }
}