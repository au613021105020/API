import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:untitled1/home%20page.dart';
import 'package:untitled1/singup.dart';

import 'main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: "489174316062-seausc5l8okjoc914ar15goe3pgpf2o2.apps.googleusercontent.com",
  );

  get onThemeChange => null;
  get isDark => null;


  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        if (googleUser == null) return null;

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(isDark: isDark, onThemeChange: onThemeChange),
          ),
        );
        return user;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In failed"), backgroundColor: Colors.red),
      );
    }
    return null;
  }


  Future<void> logInWithEmailPassword() async {
    final email = emailCtrl.text.trim();
    final password = passCtrl.text.trim();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password'), backgroundColor: Colors.black),
      );
      return;
    }

    if (currentUser != null && currentUser.email == email) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User already logged in'), backgroundColor: Colors.blue),
      );
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(isDark: isDark, onThemeChange: onThemeChange),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String msg = 'please go to singup ';
      if (e.code == 'user-not-found') {
        msg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password provided.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), backgroundColor: Colors.red),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred'), backgroundColor: Colors.red),
      );
    }
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

          title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passCtrl,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                logInWithEmailPassword();
              },
              
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Login"),
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SignupPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text("Signup"),
              ),
            ),
               SizedBox( height: 20),
              OutlinedButton(onPressed: (){
                Navigator .push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              }, child: Text(" google sing"))
          ],
        ),
      ),
    );
  }
}


Home({required bool isDark, required onThemeChange}) {
  return Container();
}