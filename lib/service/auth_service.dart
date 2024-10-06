// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/constants.dart';
import 'package:myapp/models/product.dart';
import 'dart:convert';
import '../models/user.dart';

class AuthService {
  // Méthode de connexion avec requête POST
  static Future<Map<String, dynamic>> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    final loginUrl = Uri.parse('$apiUrl/login');

    try {
      final response = await http.post(
        loginUrl,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Response data: $data'); // Pour débogage

        // Si vous avez besoin du token pour des opérations ultérieures
        final token = data['token'];
        print('Token JWT: $token');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
        return data; // Retourne les données reçues
      } else {
        // Si la connexion échoue, montrez un message et lancez une exception
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to login: ${response.body}')),
        );
        throw Exception('Login failed: ${response.body}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
      throw Exception('An error occurred: $e'); // Lance une exception
    }
  }

  // Méthode d'inscription avec requête POST
  static Future<void> signUpUser(User userData, BuildContext context) async {
    final signUpUrl = Uri.parse('$apiUrl/register');

    try {
      final response = await http.post(
        signUpUrl,
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


  //Mehtode pour afficher les produits
  // Fonction pour récupérer la liste des produits
  static Future<List<dynamic>> fetchProducts(String token) async {
    final productUrl = Uri.parse('$apiUrl/products/all');

    try {
      final response = await http.get(
        productUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Utilisez le token pour l'authentification
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
         // Convertir chaque élément JSON en objet Product et retourner la liste
      return jsonResponse.map((product) => Product.fromJson(product)).toList();      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {

      // ignore: avoid_print
      print('Error fetching products: $error');
      rethrow;
    }
  }
}

class ProductService{
  //Mehtode pour afficher les produits
  // Fonction pour récupérer la liste des produits
  static Future<List<Product>> fetchProducts(String token) async {
    final productUrl = Uri.parse('$apiUrl/products/all');

    try {
      final response = await http.get(
        productUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Utilisez le token pour l'authentification
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
         // Convertir chaque élément JSON en objet Product et retourner la liste
      return jsonResponse.map((product) => Product.fromJson(product)).toList();      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {

      // ignore: avoid_print
      print('Error fetching products: $error');
      rethrow;
    }
  }
}