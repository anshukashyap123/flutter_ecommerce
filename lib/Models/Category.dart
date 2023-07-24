class Category {
  final int categoryId;
  final String categoryName;
  final String categoryImage;
  final int mainCategoryId;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.mainCategoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['CategoryId'],
      categoryName: json['CategoryName'],
      categoryImage: json['CategoryImage'],
      mainCategoryId: json['MainCategoryId'],
    );
  }
}