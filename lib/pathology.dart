import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medlog/options.dart';
import 'image_list.dart';
import 'image_upload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class pathology extends StatefulWidget {
  const pathology({Key? key}) : super(key: key);

  @override
  State<pathology> createState() => pathologyState();
}

class pathologyState extends State<pathology> {
  GlobalKey<FormState> key = GlobalKey();

  List searchResult = [];

  Future<void> searchFromFirebase() async {
    final result = await FirebaseFirestore.instance.collection('pathology').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    searchFromFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pathology/Microbiology Bill'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 241, 45, 88),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 45, 88),
              ),
              child: Text(
                'Explore!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_a_photo),
              title: const Text('Add another image'),
              onTap: () {
                // add logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddItem(),
                  ),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.image),
            //   title: Text('View images'),
            //   onTap: () {
            //     // add logic here
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ItemList(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact Us'),
              onTap: () {
                // add logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHome(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          )),
        child: Column(
          children : [
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  String url = searchResult[index]['image'];

                  return ListTile(
                    title: SizedBox(
                      height: 200,
                      width: 200,
                      child : Image.network(url),
                    ),
                  );
                },
              ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddItem()));
        },
        backgroundColor : Color.fromARGB(255, 241, 45, 88),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}