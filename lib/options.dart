import 'package:flutter/material.dart';

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
          title: Text('MedLog'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/backgroundmed.jpg'),
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
                    color: Colors.indigo),
                child: ListTile(
                  title: Text('Prescription'),
                  subtitle: Text('Tap for adding prescription'),
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
                  tileColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigo),
              child: ExpansionTile(
                title: Text('Lab reports'),
                subtitle: Text('Tap for adding lap reports'),
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
                    title: Text('Pathology/Microbiology'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MedicinePage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Imaging'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConsultationPage()),
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
                  color: Colors.indigo),
              child: ExpansionTile(
                title: Text('Bills'),
                subtitle: Text('Tap for adding bills'),
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
                    title: Text('Medicine'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MedicinePage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Consultation'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConsultationPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Lab Test/Reports'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LabTestPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Hospitalization Charges'),
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

class PrescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Prescription'),
      ),
      body: Center(
        child: Text('Prescription Page'),
      ),
    ));
  }
}

class MedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Medicine"),
        onPressed: () => Navigator.pop(context),
      )),
    );
  }
}

class ConsultationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Consultation'),
        ),
        body: Center(
          child: Text('Consultation Page'),
        ));
  }
}

class LabTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Test/Reports'),
      ),
      body: Center(
        child: Text('Lab Test/Reports Page'),
      ),
    );
  }
}

class HospitalizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitalization Charges'),
      ),
      body: Center(
        child: Text('Hospitalization Charges Page'),
      ),
    );
  }
}

class LabReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Reports'),
      ),
      body: Center(
        child: Text('Lab Reports Page'),
      ),
    );
  }
}