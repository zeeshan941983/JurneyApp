class CategoryModel {
  String id;
  String name;
  List<SubCategory> subCategories;
  List<PriceModel> priceModel;
  String iconURL;

  CategoryModel({
    this.id = '',
    this.name = '',
    this.subCategories = const [],
    this.priceModel = const [],
    this.iconURL = '',
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      subCategories: (json['subCategories'] as List<dynamic>? ?? [])
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      priceModel: (json['priceModel'] as List<dynamic>? ?? [])
          .map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      iconURL: json['iconURL'] ?? '',
    );
  }
}

class SubCategory {
  String id;
  String name;
  List<SubCategory> subCategories;

  SubCategory({
    required this.id,
    required this.name,
    this.subCategories = const [],
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      subCategories: (json['subCategories'] as List<dynamic>? ?? [])
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PriceModel {
  String id;
  String name;

  PriceModel({
    required this.id,
    required this.name,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
