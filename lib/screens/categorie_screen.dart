import 'package:flutter/material.dart';
import 'package:instrument/widgets/app_bar.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Catégories"),
      body: Center(
        child: const Text("Catégories")
      )
    );
  }
}