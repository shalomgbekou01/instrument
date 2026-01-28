// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = "http://127.0.0.1:8000/api/users";

Future<void> inscription({
  required String username,
  required String nom,
  required String prenom,
  required String email,
  required String filiere,
  required String password,
}) async {
  final response = await http.post(
    Uri.parse(baseUrl),

    headers: {"Content-type": "application/json"},

    body: jsonEncode({
      "username": username,
      "first_name": nom,
      "last_name": prenom,
      "email": email,
      "password": password,
      "filiere": filiere,
    }),
  );

  if (response.statusCode != 201) {
    throw Exception("erreur lors de l'inscription");
  }
}

Future<List<dynamic>> fetchUsers() async {
  final response = await http.get(.parse(baseUrl));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Erreur lors du chargement des données");
  }
}

Future<void> updateUser({
  required int id,
  required String username,
  required String nom,
  required String prenom,
  required String email,
  required String filiere,
}) async {
  await http.put(
    Uri.parse("$baseUrl/$id"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "username": username,
      "first_name": nom,
      "last_name": prenom,
      "email": email,
      "filiere": filiere,
    }),
  );
}

Future<void> deleteUser(int id) async {
  await http.delete(Uri.parse("$baseUrl/$id"));
}
