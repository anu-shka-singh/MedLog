// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Prescription Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PrescriptionPage(),
//     );
//   }
// }
// class PrescriptionPage extends StatefulWidget {
//   const PrescriptionPage({super.key});

//   @override
//   State<PrescriptionPage> createState() => _PrescriptionPageState();
// }

// class _PrescriptionPageState extends State<PrescriptionPage> {
  

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Prescription'),
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(255, 241, 45, 88),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color:  Color.fromARGB(255, 241, 45, 88),
//               ),
//               child: Text(
//                 'Explore!',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                 ),
//               ),
              
//             ),
//             ListTile(
//               leading: Icon(Icons.add_a_photo),
//               title: Text('Add another image'),
//               onTap: () {
//                 // add logic here
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.contact_phone),
//               title: Text('Contact us'),
//               onTap: () {
//                 // add logic here
//               },
//             ),
//           ],
//         ),
//       ),
//       // body: GridView.count(
//       //   crossAxisCount: 2,
//       //   children: List.generate(6, (index) {
//       //     return Center(
//       //       child: Image.asset(
//       //         'assets/images/image${index+1}.jpg',
//       //         width: 200,
//       //         height: 200,
//       //         fit: BoxFit.cover,
//       //       ),
//       //     );
//       //   }),
//       // ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medlog/options.dart';
import 'contactus.dart';
import 'image_list.dart';
import 'image_upload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({Key? key}) : super(key: key);

  @override
  State<PrescriptionPage> createState() => PrescriptionPageState();
}

class PrescriptionPageState extends State<PrescriptionPage> {
  GlobalKey<FormState> key = GlobalKey();

  List searchResult = [];

  Future<void> searchFromFirebase() async {
    final result = await FirebaseFirestore.instance.collection('prescription').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    searchFromFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'),
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
                    builder: (context) => ContactUs(),
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