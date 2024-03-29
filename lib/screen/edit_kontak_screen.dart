import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/data/firebase_controller.dart';

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
  void dispose() {
    namaController.dispose();
    noTelpController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // widget.nama;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit kontak'),
        actions: [
          IconButton(
              onPressed: () async {
                var hasil = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text('Delete?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.red)),
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Delete'),
                            ),
                          ],
                        ));
                if (hasil == true) {
                  FirebaseController().deleteUser(widget.id);
                  Navigator.pop(context, true);
                }
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Form(
        child: Column(
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
                FirebaseController().updateUser(uuid: widget.id, data: {
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
      ),
    );
  }
}
