import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: medicinebill(),
    );
  }
}
class medicinebill extends StatefulWidget {
  const medicinebill({super.key});

  @override
  State<medicinebill> createState() => _medicinebillState();
}

class _medicinebillState extends State<medicinebill> {
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Bill'),
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
     
    );
  }
}


