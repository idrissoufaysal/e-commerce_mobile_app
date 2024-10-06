class Product {
  final String id;
  final String label;
  final String description;
  final int price;
  final String picture;
  final Category category;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.label,
    required this.description,
    required this.price,
    required this.picture,
    required this.category,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  // Méthode pour convertir un JSON en objet Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      label: json['label'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      picture: json['picture'] ?? '',
      category: Category.fromJson(json['category'] ?? {}),
      isActive: json['isActive'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  // Méthode pour convertir l'objet Product en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'description': description,
      'price': price,
      'picture': picture,
      'category': category.toJson(),
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

// Modèle pour la catégorie des produits
class Category {
  final String id;
  final String label;
  final String description;
  final bool isActive;

  Category({
    required this.id,
    required this.label,
    required this.description,
    required this.isActive,
  });

  // Méthode pour convertir un JSON en objet Category
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      label: json['label'] ?? '',
      description: json['description'] ?? '',
      isActive: json['isActive'] ?? false,
    );
  }

  // Méthode pour convertir l'objet Category en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'description': description,
      'isActive': isActive,
    };
  }
}
