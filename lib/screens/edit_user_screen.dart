import 'package:flutter/material.dart';
import 'package:instrument/services/user_service.dart';

class EditUserPage extends StatefulWidget {
  final Map user;

  const EditUserPage({super.key, required this.user});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late int userId;
  late TextEditingController usernameController;
  late TextEditingController nomController;
  late TextEditingController prenomController;
  late TextEditingController filiereController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userId = widget.user['id'];
    usernameController = TextEditingController(text: widget.user['username']);
    emailController = TextEditingController(text: widget.user['email']);
    nomController = TextEditingController(text: widget.user['first_name']);
    prenomController = TextEditingController(text: widget.user['last_name']);
    filiereController = TextEditingController(text: widget.user['filiere']);
  }

  Future<void> update() async {
    try {
      await updateUser(
        id: userId,
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        nom: nomController.text.trim(),
        filiere: filiereController.text.trim(),
        prenom: prenomController.text.trim(),
      );

      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erreur lors de la mise à jour"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Modifier l'utilisateur")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 30),
          child: Center(
            child: Column(
              spacing: 15,
              children: [
                const Text("Inscription", style: TextStyle(fontSize: 30)),

                TextField(
                  controller: usernameController,
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
                  controller: nomController,
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
                  controller: prenomController,
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
                  controller: filiereController,
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
                  controller: emailController,
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

                ElevatedButton(
                  onPressed: update,
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 100),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 78, 112, 249),
                    ),
                  ),
                  child: Text(
                    "Mettre à jour",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
