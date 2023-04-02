import 'dart:convert';
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
  // TextEditingController _controllerName = TextEditingController();
  // TextEditingController _controllerQuantity = TextEditingController();
  String parsedtext = '';

  GlobalKey<FormState> key = GlobalKey();

  final docuser = FirebaseFirestore.instance.collection('hospitallBill').doc();

  String imageUrl = '';
  
  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add images'),
        backgroundColor: Color.fromARGB(255, 241, 45, 88),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            child: Column(
              children: [
                
                IconButton(
                    onPressed: () async {
      
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      print('${file?.path}');
      
                      var bytes = File(file!.path.toString()).readAsBytesSync();
                      String img64 = base64Encode(bytes);
      
                      var url = 'https://api.ocr.space/parse/image';
                      var payload = {
                        "base64Image": "data:image/jpg;base64,${img64.toString()}"
                      };
                      var header = {"apikey": 'K89642807588957'};
                      var post = await http.post((url = url) as Uri,
                          body: payload, headers: header);
      
                      var result = jsonDecode(post.body);
                      setState(() {
                        parsedtext = result['ParsedResults'][0]['ParsedText'];
                      });
      
                      if (file == null) return;
                      //Import dart:core
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();
      
                      //Step 2: Upload to Firebase storage/
                      //Install firebase_storage
                      //Import the library
      
                      //Get a reference to storage root
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                          referenceRoot.child('images');
      
                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                          referenceDirImages.child('$uniqueFileName');
      
                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file.path));
                        //Success: get the download URL
                        imageUrl = await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        //Some error occurred
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Please upload the image again')));
                      }
                    },
                    icon: const Icon(Icons.camera_alt)),
                ElevatedButton(
                    onPressed: () async {
                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please upload an image'),
                          ),
                        );
                      }
      
                      if (key.currentState!.validate()) {
                        // String itemName = _controllerName.text;
                        // String itemQuantity = _controllerQuantity.text;
      
                        //Create a Map of data
                        Map<String, String> dataToSend = {
                          // 'name': itemName,
                          // 'quantity': itemQuantity,
                          'image': imageUrl,
                        };
      
                        //Add a new item
                        docuser.set(dataToSend);
                      }
                    },
                    child: Text('Submit'),
              
                    ),
      
                  Container(
                    child : Text(parsedtext),
                  ),
      
      
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
