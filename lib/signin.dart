import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medlog/pick_file.dart';
import 'package:medlog/reusable_widget.dart';
import 'package:medlog/signup.dart';

import 'get_started.dart';
import 'myhomepage.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Color.fromARGB(255, 0, 0, 0),
        //   Color.fromARGB(255, 43, 40, 41),
        //   Color.fromARGB(255, 105, 102, 103)
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          )),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("images/logo_medlog.jpeg"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              reusableTextField(
                "Enter Username",
                Icons.person_outline,
                false,
                _emailTextController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              reusableTextField(
                "Enter Password",
                Icons.lock_outline,
                true,
                _passwordTextController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  //checkCategory(_emailTextController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("${error.toString().split(']')[1]}")),
                  );
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption()
            ],
          ),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ",
            style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
