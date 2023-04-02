// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hospital Bill',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HospitalizationPage(),
//     );
//   }
// }
// class HospitalizationPage extends StatefulWidget {
//   const HospitalizationPage({super.key});

//   @override
//   State<HospitalizationPage> createState() => _HospitalizationPageState();
// }

// class _HospitalizationPageState extends State<HospitalizationPage> {
 


//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hospital Bill'),
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
     
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medlog/options.dart';
import 'image_list.dart';
import 'image_upload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class hospitalbill extends StatefulWidget {
  const hospitalbill({Key? key}) : super(key: key);

  @override
  State<hospitalbill> createState() => hospitalbillState();
}

class hospitalbillState extends State<hospitalbill> {
  GlobalKey<FormState> key = GlobalKey();

  List searchResult = [];

  Future<void> searchFromFirebase() async {
    final result = await FirebaseFirestore.instance.collection('hospitalbill').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    searchFromFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Bill'),
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