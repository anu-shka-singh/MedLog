// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class PickFile extends StatefulWidget {
//   const PickFile({super.key});

//   @override
//   State<PickFile> createState() => PickFileState();
// }

// class PickFileState extends State<PickFile> {
//   PlatformFile? pickedFile;
//   UploadTask? uploadTask;

//   Future uploadFile() async {
//     final path = 'files/${pickedFile!.name}';
//     final file = File(pickedFile!.path!);

//     final ref = FirebaseStorage.instance.ref().child(path);
//     setState(() {
//       uploadTask = ref.putFile(file); 
//     });

//     final snapshot = await uploadTask!.whenComplete(() {});

//     final urlDownload = await snapshot.ref.getDownloadURL();
//     print('Download Link: $urlDownload');

//     setState(() {
//       uploadTask = null;
//     });
//   }

//   Future selectFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result == null) {
//       return;
//     }
//     setState(() {
//       pickedFile = result.files.first;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Data'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (pickedFile != null)
//               Expanded(
//                 child: Container(
//                   color: Colors.blue[100],
//                   child: Center(
//                     child: Image.file(
//                       File(pickedFile!.path!),
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: selectFile,
//               child: const Text('Select File'),
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: uploadFile,
//               child: const Text('Upload File'),
//             ),
//             const SizedBox(height: 32),
//             buildProgress(),
//           ],
//         ),
//       ),
//     );    
//   }
//   Widget buildProgress() => StreamBuilder<TaskSnapshot>(stream: uploadTask?.snapshotEvents ,
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       final data = snapshot.data!;
//       double progress = data.bytesTransferred/data.totalBytes;

//       return SizedBox(
//         height: 50,
//         child: Stack(fit: StackFit.expand,
//         children: [
//           LinearProgressIndicator(
//             value: progress,
//             backgroundColor: Colors.grey,
//             color: Colors.green,
//           ),
//           Center(
//             child: Text(
//               '${(100*progress).roundToDouble()}%',
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//         ),
//       );
//     }
//     else {
//       return const SizedBox(height: 50);
//     }
//   });
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatefulWidget {
  final File? imageFile;
  final Function(File?) onImageSelected;

  const ImagePickerDialog({
    Key? key,
    required this.imageFile,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  late File? _imageFile;

  @override
  void initState() {
    _imageFile = widget.imageFile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Choose an image'),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        height: 100,
        child: Center(
          child: _imageFile != null
              ? Image.file(_imageFile!)
              : const Icon(Icons.image, size: 50),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              setState(() {
                _imageFile = File(pickedFile.path);
              });
              widget.onImageSelected(_imageFile);
            }
          },
          child: const Text('From Gallery'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () async {
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.camera);
            if (pickedFile != null) {
              setState(() {
                _imageFile = File(pickedFile.path);
              });
              widget.onImageSelected(_imageFile);
            }
          },
          child: const Text('From Camera'),
        ),
      ],
    );
  }
}
