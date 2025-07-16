import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/home%20page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> signupUser() async {
    // ✅ Check form input
    if (_formKey.currentState!.validate()) {
      try {
        // ✅ Try Firebase Signup
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailCtrl.text.trim(),
          password: passCtrl.text.trim(),
        );

        // ✅ If success → go to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      } on FirebaseAuthException catch (e) {

        String msg = 'Signup failed';
        if (e.code == 'email-already-in-use') {
          msg = 'Email already in use';
        } else if (e.code == 'invalid-email') {
          msg = 'Invalid email';
        } else if (e.code == 'weak-password') {
          msg = 'Weak password (min 6 chars)';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email required";
                  if (!value.contains('@')) return "Invalid email";
                  return null;
                },
              ),
              TextFormField(
                controller: passCtrl,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Password required";
                  if (value.length < 6) return "Min 6 characters";
                  return null;
                },
              ),
          SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Text("Signup"),

            ),
          ),

            ],
          ),
        ),
      ),
    );
  }
}
