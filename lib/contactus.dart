import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Drawer Example',
//       home: ContactUs(),
//     );
//   }
// }

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
            title: Text('Contact Us'),
            backgroundColor: Color.fromARGB(255, 241, 45, 88),
            centerTitle: true,
          ),
          body:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          )),
          child:Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   'Contact Us',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 30.0,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Text('Please fill this form in case of any query!'),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: "Name",
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          maxLines: 7,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: "Message",
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: double.infinity,
                          height: 50,
                          // color: Color.fromRGBO(r, g, b, opacity),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ]),
          ),
          ),
        ),);
  }
}