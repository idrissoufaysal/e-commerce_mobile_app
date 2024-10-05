import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/auth_response.dart';
import '../models/user.dart';


class AuthService {
  // Méthode de connexion avec requête POST
  static Future<void> loginUser(String email, String password, BuildContext context) async {
    final url = Uri.parse('https://votre-backend.com/api/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final authResponse = AuthResponse.fromJson(data);

        print('Token JWT: ${authResponse.token}');
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful! Token: ${authResponse.token}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to login: ${response.body}')),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  // Méthode d'inscription avec requête POST
  static Future<void> signUpUser(User userData, BuildContext context) async {
    final url = Uri.parse('https://votre-backend.com/api/signup');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(userData.toJson()),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        print('User registered successfully: ${data['message']}');

        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('Sign-up successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}
