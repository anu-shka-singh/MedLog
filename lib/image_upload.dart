import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  GlobalKey<FormState> key = GlobalKey();

  final docUser = FirebaseFirestore.instance.collection('prescription').doc();

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitilization Charges'),
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

            // ListTile(
            //   leading: Icon(Icons.add_a_photo),
            //   title: Text('Add another image'),
            //   onTap: () {
            //     // add logic here
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.contact_phone),
            //   title: Text('Contact us'),
            //   onTap: () {
            //     // add logic here
            //   },
            // ),
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
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Error uploading image. Please upload again.')));
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
                    }

                    if (key.currentState!.validate()) {
                      Map<String, String> dataToSend = {
                        'image': imageUrl,
                      };

                      //Add a new item
                      docUser.set(dataToSend);
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