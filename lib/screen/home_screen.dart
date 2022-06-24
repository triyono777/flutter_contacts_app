import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts_app/screen/edit_kontak_screen.dart';

import '../data/data_kontak.dart';
import '../data/firebase_controller.dart';
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
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseController().getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (!snapshot.hasData) {
                return Center(child: Text('No data'));
              } else {
                return bodyWidget(snapshot);
              }
            }
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

  Widget bodyWidget(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    var allData = snapshot.data?.docs;
    print(allData);
    return ListView.builder(
        itemCount: allData?.length,
        itemBuilder: (context, index) {
          return ItemKontakWidget(
            onTap: () async {
              var hasil = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditKontakScreen(
                    id: allData?[index].id ?? '',
                    nama: allData?[index]["nama"],
                    noTelp: allData?[index]["nomor_telp"],
                    alamat: allData?[index]["alamat"],
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
        });
  }
}
