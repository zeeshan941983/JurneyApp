class UserDocumentModel {
  String? id;
  String? title;
  String? address;
  Category? category;
  SubCategory? subCategory;
  int? price;
  int? extras;
  String? extraMessage;
  String? image;

  UserDocumentModel({
    this.id,
    this.title,
    this.address,
    this.category,
    this.subCategory,
    this.price,
    this.extras,
    this.extraMessage,
    this.image,
  });

  factory UserDocumentModel.fromJson(Map<String, dynamic> json) {
    return UserDocumentModel(
      id: json['_id'],
      title: json['title'],
      address: json['address'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      subCategory: json['subCategory'] != null
          ? SubCategory.fromJson(json['subCategory'])
          : null,
      price: json['price'],
      extras: json['extras'],
      extraMessage: json['extra_message'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'address': address,
      'category': category?.toJson(),
      'subCategory': subCategory?.toJson(),
      'price': price,
      'extras': extras,
      'extra_message': extraMessage,
      'image': image,
    };
  }
}

class Category {
  String? id;
  String? name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class SubCategory {
  String? id;
  String? name;

  SubCategory({this.id, this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class UserServiceModel {
  int? totalPages;
  int? currentPage;
  int? totalDocuments;
  List<UserDocumentModel>? documents;

  UserServiceModel(
      {this.totalPages, this.currentPage, this.totalDocuments, this.documents});

  factory UserServiceModel.fromJson(Map<String, dynamic> json) {
    return UserServiceModel(
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
      totalDocuments: json['totalDocuments'],
      documents: (json['documents'] as List<dynamic>)
          .map((doc) => UserDocumentModel.fromJson(doc))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPages': totalPages,
      'currentPage': currentPage,
      'totalDocuments': totalDocuments,
      'documents': documents?.map((doc) => doc.toJson()).toList(),
    };
  }
}
