import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathology',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: pathology(),
    );
  }
}
class pathology extends StatefulWidget {
  const pathology({super.key});

  @override
  State<pathology> createState() => _pathologyState();
}

class _pathologyState extends State<pathology> {
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pathology/Microbiology'),
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


