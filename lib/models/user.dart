class User {
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String password; 
  final String country;
  final List<String> roles;
  final bool verified;

  User({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password, 
    required this.country,
    required this.roles,
    required this.verified,
  });

  // Méthode pour convertir un JSON en objet User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '', // Fournir une valeur par défaut si nécessaire
      email: json['email'] ?? '',
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      password: json['password'] ?? '', // Vous pouvez ignorer cela lors de la récupération de l'utilisateur
      country: json['country'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
      verified: json['verified'] ?? false,
    );
  }

  // Méthode pour convertir l'objet User en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'password': password, // Inclure le mot de passe lors de l'inscription
      'country': country,
      'roles': roles,
      'verified': verified,
    };
  }
}
