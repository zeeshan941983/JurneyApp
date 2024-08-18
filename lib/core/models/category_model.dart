class Category {
  String id;
  String name;
  List<SubCategory> subCategories;
  List<PriceModel> priceModel;
  String iconURL;

  Category({
    this.id = '',
    this.name = '',
    this.subCategories = const [],
    this.priceModel = const [],
    this.iconURL = '',
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      subCategories: (json['subCategories'] ?? []).map((e) => SubCategory.fromJson(e)).toList(),
      priceModel: (json['priceModel'] ?? []).map((e) => PriceModel.fromJson(e)).toList(),
      iconURL: json['iconURL'] ?? '',
    );
  }
}
class SubCategory {
  String id;
  String name;

  SubCategory({
    required this.id,
    required this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
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
      id: json['id'],
      name: json['name'],
    );
  }
}