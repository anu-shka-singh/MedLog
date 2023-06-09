import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'get_started.dart';
import 'myhomepage.dart';
import 'signin.dart';
import 'reusable_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Color.fromARGB(255, 0, 0, 0),
        //   Color.fromARGB(255, 43, 40, 41),
        //   Color.fromARGB(255, 105, 102, 103)
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("images/logo_medlog.jpeg"),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () async {
                  Future<bool> userExists = doesUserExist(
                      emailTextController.text, _passwordTextController.text);
                  if (await userExists) {
                    print("user exists");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Signin()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('This email is already registered')),
                    );
                  } else {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    }).onError((error, stackTrace) {});
                  }
                })
              ],
              // ignore: avoid_print
              //.catchError((err) => print(err));
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> doesUserExist(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password:
            password, // This can be empty as we're only checking if user exists
      );
      // If signInWithEmailAndPassword succeeds, user already exists
      return true;
    } on FirebaseAuthException catch (e) {
      // If signInWithEmailAndPassword fails with user-not-found error, user doesn't exist
      if (e.code == 'user-not-found') {
        return false;
      }
    }
    return true;
  }
}
