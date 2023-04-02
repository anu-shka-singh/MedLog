// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Lab Report Bill',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: labreportbill(),
//     );
//   }
// }
// class labreportbill extends StatefulWidget {
//   const labreportbill({super.key});

//   @override
//   State<labreportbill> createState() => _labreportbillState();
// }

// class _labreportbillState extends State<labreportbill> {


//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lab Report Bill'),
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



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class labreportbill extends StatefulWidget {
//   const labreportbill({Key? key}) : super(key: key);

//   @override
//   State<labreportbill> createState() => _labreportbillState();
// }

// class _labreportbillState extends State<labreportbill> {
//   GlobalKey<FormState> key = GlobalKey();

//   CollectionReference _reference =
//       FirebaseFirestore.instance.collection('prescription');

//   String imageUrl = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lab Report Bill'),
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
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: key,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                   onPressed: () async {
//                     ImagePicker imagePicker = ImagePicker();
//                     XFile? file =
//                         await imagePicker.pickImage(source: ImageSource.gallery);
//                     print('${file?.path}');
//                     if (file == null) return;
//                     String uniqueFileName =
//                         DateTime.now().millisecondsSinceEpoch.toString();
//                     Reference referenceRoot = FirebaseStorage.instance.ref();
//                     Reference referenceDirImages =
//                         referenceRoot.child('images');
//                     Reference referenceImageToUpload =
//                         referenceDirImages.child('$uniqueFileName');
//                     try {
//                       await referenceImageToUpload.putFile(File(file.path));
//                       //Success: get the download URL
//                       imageUrl = await referenceImageToUpload.getDownloadURL();
//                     } catch (error) {
//                       //Some error occurred
//                     }
//                   },
//                   icon: Icon(Icons.camera_alt,
//                   size:30),
//                   ),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (imageUrl.isEmpty) {
//                       ScaffoldMessenger.of(context)
//                           .showSnackBar(SnackBar(content: Text('Please upload an image')));

//                       return;
//                     }

//                     if (key.currentState!.validate()) {
//                       Map<String, String> dataToSend = {
//                         'image': imageUrl,
//                       };
//                       _reference.add(dataToSend);
//                     }
//                   },
//                   child: Text('Submit'))
                  
//             ],
//           ),
//         ),
//       ),
//       ),
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

class labreportbill extends StatefulWidget {
  const labreportbill({Key? key}) : super(key: key);

  @override
  State<labreportbill> createState() => labreportbillState();
}

class labreportbillState extends State<labreportbill> {
  GlobalKey<FormState> key = GlobalKey();

  List searchResult = [];

  Future<void> searchFromFirebase() async {
    final result = await FirebaseFirestore.instance.collection('labreportbill').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    searchFromFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Report'),
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