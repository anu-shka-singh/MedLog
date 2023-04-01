// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePicker extends StatefulWidget {
//   const ImagePicker({super.key});

//   @override
//   State<ImagePicker> createState() => _ImagePickerState();
// }

// class _ImagePickerState extends State<ImagePicker> {

//   bool textScanning = false;
//   XFile? imageFile;
//   String scannedText = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
//   void getImage(ImageSource source) async {
//     try {
//       final pickedImage = await ImagePicker.pickImage(source : source);
//       if (pickedImage != null) {
//         textScanning = true;
//         imageFile = pickedImage;
//         setState(() {
          
//         });
//         getRecognisedText(pickedImage);
//       }
//     }
//     catch(e) {
//       textScanning = false;
//       imageFile = null;
//       setState(() {
//         scannedText = "Error occured while scanning";
//       });
//     }
//   }

//   void getRecognisedText(XFile image) async {
//     final inputImage = InputImage.fromFilePath(image.path);
//     final textDetector = GoogleMlKit.vision.textDetector();
//     RecognisedText recognisedText = await TextDetector.processImage(inputImage);
//     await textDetector.close();
//     scannedText = '';
//     for (TextBlock block in recognisedText.blocks) {
//       for (TextLine line in block.lines) {
//         scannedText = '$scannedText${line.text}\n';
//       }
//     }
//     textScanning = false;
//     setState(() {
      
//     });
//   }
// }