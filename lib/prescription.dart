import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prescription Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrescriptionPage(),
    );
  }
}
class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({super.key});

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  

  

  @override
  Widget build(BuildContext context) {
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
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   children: List.generate(6, (index) {
      //     return Center(
      //       child: Image.asset(
      //         'assets/images/image${index+1}.jpg',
      //         width: 200,
      //         height: 200,
      //         fit: BoxFit.cover,
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}
