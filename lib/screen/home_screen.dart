import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/screen/edit_kontak_screen.dart';

import '../data/data_kontak.dart';
import '../widgets/item_kontak_widget.dart';
import './tambah_kontak_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: ListView.builder(
          itemCount: dataKontak.length,
          itemBuilder: (context, index) {
            return ItemKontakWidget(
              onTap: () async {
                var hasil = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditKontakScreen(
                      id: dataKontak[index]["id"],
                      nama: dataKontak[index]["nama"],
                      noTelp: dataKontak[index]["nomor_telp"],
                      alamat: dataKontak[index]["alamat"],
                    ),
                  ),
                );
                if (hasil == true) {
                  setState(() {});
                }
              },
              nama: dataKontak[index]['nama'],
              noTelp: dataKontak[index]['nomor_telp'],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var hasil = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahKontakScreen(),
            ),
          );
          if (hasil == true) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
