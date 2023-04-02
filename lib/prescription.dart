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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({Key? key}) : super(key: key);

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('prescription');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription Page'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 241, 45, 88),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 241, 45, 88),
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
              leading: Icon(Icons.add_a_photo),
              title: Text('Add another image'),
              onTap: () {
                // add logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact us'),
              onTap: () {
                // add logic here
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.gallery);
                    print('${file?.path}');
                    if (file == null) return;
                    String uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('images');
                    Reference referenceImageToUpload =
                        referenceDirImages.child('$uniqueFileName');
                    try {
                      await referenceImageToUpload.putFile(File(file.path));
                      //Success: get the download URL
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      //Some error occurred
                    }
                  },
                  icon: Icon(Icons.camera_alt,
                  size:30),
                  ),
              ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Please upload an image')));

                      return;
                    }

                    if (key.currentState!.validate()) {
                      Map<String, String> dataToSend = {
                        'image': imageUrl,
                      };
                      _reference.add(dataToSend);
                    }
                  },
                  child: Text('Submit'))
                  
            ],
          ),
        ),
      ),
      ),
    );
  }
}