import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instrument/screens/main_screen.dart';
import 'package:instrument/services/user_service.dart';
import 'package:instrument/widgets/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController filiere = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> _inscrire() async{
    setState(() {
      _isLoading = true;
    });

    await inscription(
      username: username.text.trim(), 
      nom: nom.text.trim(), 
      prenom: prenom.text.trim(), 
      email: email.text.trim(), 
      filiere: filiere.text.trim(), 
      password: password.text.trim()
    );

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Inscription réussie !"),
            backgroundColor: Colors.green,
          ),
        );
      }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
  );
  }

  Future<void> _addUserData(String uuid) async {
    await FirebaseFirestore.instance.collection("users").doc(uuid).set({
      "nom": nom.text.trim(),
      "prenom": prenom.text.trim(),
      "filiere": filiere.text.trim(),
    });
  }

  Future<void> _signin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim(),
          );

      String uuid = userCredential.user!.uid;

      await _addUserData(uuid);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Inscription réussie !"),
            backgroundColor: Colors.green,
          ),
        );
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.code), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "MediaStore"),

      drawer: const Drawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 30),
          child: Center(
            child: Column(
              spacing: 15,
              children: [
                const Text("Inscription", style: TextStyle(fontSize: 30)),

                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Nom d'utilisateur",
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                TextField(
                  controller: nom,
                  decoration: InputDecoration(
                    hintText: "Votre nom",
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                TextField(
                  controller: prenom,
                  decoration: InputDecoration(
                    hintText: "Votre prénom",
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                TextField(
                  controller: filiere,
                  decoration: InputDecoration(
                    hintText: "Votre filière",
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Votre mot de passe",
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: _inscrire,
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 120),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 78, 112, 249),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "S'incrire",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
