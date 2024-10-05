import 'package:flutter/material.dart';
import '../models/user.dart';

class UserModel with ChangeNotifier {
  User? _user; // Instance de User
  String? _token; // Propriété pour stocker le token

  User? get user => _user;
  String? get token => _token; // Getter pour le token

  void setUser(User user, String token) {
    _user = user;
    _token = token; // Stockez le token
    notifyListeners(); // Notifie tous les consommateurs de l'état
  }

  void clearUser() {
    _user = null;
    _token = null; // Réinitialisez le token lors de la déconnexion
    notifyListeners();
  }
}
