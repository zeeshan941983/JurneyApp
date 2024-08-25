class Amenity {
  final String id;
  final String name;
  final String iconURL;

  Amenity({
    required this.id,
    required this.name,
    required this.iconURL,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) {
    return Amenity(
      id: json['_id'],
      name: json['name'],
      iconURL: json['iconURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'iconURL': iconURL,
    };
  }
}
