class Category {
  String name;
  String image;
  List<CategoryItem> categories;

  Category({
    required this.name,
    required this.image,
    required this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    List<CategoryItem> categoryItems = (json['categories'] as List<dynamic>)
        .map((item) => CategoryItem.fromJson(item))
        .toList();

    return Category(
      name: json['name'],
      image: json['image'],
      categories: categoryItems,
    );
  }
}

class CategoryItem {
  bool isPremium;
  String image;
  bool? isFavorite;

  CategoryItem({
    required this.isPremium,
    required this.image,
    this.isFavorite,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      isPremium: json['isPremium'],
      image: json['image'],
      isFavorite: json['isFavorite'],
    );
  }
}