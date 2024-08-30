class PopularModel {
  final int totalPages;
  final int currentPage;
  final int totalDocuments;
  final List<DocumentModel> documents;

  PopularModel({
    required this.totalPages,
    required this.currentPage,
    required this.totalDocuments,
    required this.documents,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['currentPage'] ?? 0,
      totalDocuments: json['totalDocuments'] ?? 0,
      documents: (json['documents'] as List)
          .map((item) => DocumentModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPages': totalPages,
      'currentPage': currentPage,
      'totalDocuments': totalDocuments,
      'documents': documents.map((x) => x.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'PopularModel(totalPages: $totalPages, currentPage: $currentPage, totalDocuments: $totalDocuments, documents: $documents)';
  }
}

class DocumentModel {
  final String id;
  final String title;
  final String address;
  final int price;
  final String user;
  final String slug;
  final double? distance;
  final List<String> images;

  DocumentModel({
    required this.id,
    required this.title,
    required this.address,
    required this.price,
    required this.user,
    required this.slug,
    this.distance,
    required this.images,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    List<String> imageUrls = (json['images'] as List)
        .map((item) => item as String)
        .toSet() // Remove duplicates
        .toList();

    return DocumentModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      price: json['price'] ?? 0,
      user: json['user'] ?? '',
      slug: json['slug'] ?? '',
      distance: json['distance'] != null
          ? (json['distance'] as num).toDouble()
          : null,
      images: imageUrls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'address': address,
      'price': price,
      'user': user,
      'slug': slug,
      'distance': distance,
      'images': images,
    };
  }

  @override
  String toString() {
    return 'DocumentModel(id: $id, title: $title, address: $address, price: $price, user: $user, slug: $slug, distance: $distance, images: $images)';
  }
}

class AddressModel {
  final String description;
  final LocationModel location;

  AddressModel({
    required this.description,
    required this.location,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      description: json['description'] ?? '',
      location: LocationModel.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'location': location.toJson(),
    };
  }

  @override
  String toString() {
    return 'AddressModel(description: $description, location: $location)';
  }
}

class LocationModel {
  final double lat;
  final double lng;

  LocationModel({
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  @override
  String toString() {
    return 'LocationModel(lat: $lat, lng: $lng)';
  }
}

class PriceModel {
  PriceModel();

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String toString() {
    return 'PriceModel()';
  }
}
