import 'package:flutter/material.dart';
import 'prescription.dart';
import 'consultationbill.dart';
import 'imaging.dart';
import 'hospitalbill.dart';
import 'labreportbill.dart';
import 'pathology.dart';
import 'medicinebill.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: <String, WidgetBuilder>{
      //   '/prescription': (BuildContext context) => PrescriptionPage(),
      // },
      debugShowCheckedModeBanner: false,
      title: 'List Tile Example',
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 45, 88),
          title: Text('MedLog',),
          centerTitle: true,
          
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          )),
          child: ListView(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrescriptionPage()));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 235, 138, 162)),
                child: ListTile(
                  title: Text('Prescription',style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Tap for adding prescription',style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(
                    Icons.medication,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  // contentPadding: EdgeInsets.all(10),
                  //dense: true,
                  //enabled: false,

                  textColor: Colors.black,
                  //tileColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  Color.fromARGB(255, 235, 138, 162)),
              child: ExpansionTile(
                title: Text('Lab reports',style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Tap for adding lap reports',style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Icon(
                  Icons.medication,
                  color: Colors.white,
                ),
                textColor: Colors.black,
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                children: [
                  ListTile(
                    title: Text('Pathology/Microbiology',style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.arrow_forward_ios_outlined , size: 20,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pathology()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Imaging',style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.arrow_forward_ios_outlined , size: 20,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => imaging()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  Color.fromARGB(255, 235, 138, 162)),
              child: ExpansionTile(
                title: Text('Bills', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Tap for adding bills',style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Icon(
                  Icons.medication,
                  color: Colors.white,
                ),
                textColor: Colors.black,
                iconColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                children: [
                  ListTile(
                    title: Text('Medicine',style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.arrow_forward_ios_outlined , size: 20,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => medicinebill()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Consultation',style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.arrow_forward_ios_outlined , size: 20,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => consultationbill()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Lab Test/Reports',style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.arrow_forward_ios_outlined , size: 20,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => labreportbill()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Hospitalization Charges',style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.arrow_forward_ios_outlined , size: 20,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalizationPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

