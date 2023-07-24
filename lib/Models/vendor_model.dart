class Vendor {
  final int vendorId;
  final int mainCategoryId;
  final int categoryId;
  final String name;
  final String pictureUrl;
  final String url;
  final String distance;
  final String address;
  final String productType;

  Vendor({
    required this.vendorId,
    required this.mainCategoryId,
    required this.categoryId,
    required this.name,
    required this.pictureUrl,
    required this.url,
    required this.distance,
    required this.address,
    required this.productType,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      vendorId: json['VendorId'] as int? ?? 0, // Provide a default value (0 in this case)
      mainCategoryId: json['MainCategoryId'] as int? ?? 0,
      categoryId: json['CategoryId'] as int? ?? 0,
      name: json['Name'] as String? ?? '', // Provide a default value ('' in this case)
      pictureUrl: json['PictureUrl'] as String? ?? '',
      url: json['Url'] as String? ?? '',
      distance: json['Distance'] as String? ?? '',
      address: json['Address'] as String? ?? '',
      productType: json['ProductType'] as String? ?? '',
    );
  }
}