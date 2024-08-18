class Categories {
  final String id;
  final String icon;
  final String name;

  Categories({required this.id, required this.icon, required this.name});

  Map<String, dynamic> toJSON() {
    return {
      '_id': id,
      'iconURL': icon,
      'name': name,
    };
  }

  factory Categories.fromJSON(Map<String, dynamic> json) {
    return Categories(
      id: json['_id'] as String,
      icon: json['iconURL'] as String,
      name: json['name'] as String,
    );
  }

  @override
  String toString() {
    return 'Categories(id: $id, icon: $icon, name: $name)';
  }
}

