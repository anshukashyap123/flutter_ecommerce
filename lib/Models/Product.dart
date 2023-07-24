class Product {
  final String productName;
  final int productId;
  final String productImage;
  final String outOfStockImage;
  final String productType;
  final dynamic productPrice; // Can be int or double
  final double productPricee;
  final dynamic afterDiscountAmount; // Can be int or double
  final double amountAfterDiscount;
  final int productSetId;
  final String? subCategoryName;
  final int subCategoryId;
  final String categoryName;
  final int categoryId;
  final int posId;
  final int vendorId;
  final String vendorName;
  final int redeemPoint;
  final int businessValue;
  final bool itemStatus;
  final int qnty;
  final double discountInPer;

  Product({
    required this.productName,
    required this.productId,
    required this.productImage,
    required this.outOfStockImage,
    required this.productType,
    required this.productPrice,
    required this.productPricee,
    required this.afterDiscountAmount,
    required this.amountAfterDiscount,
    required this.productSetId,
    required this.subCategoryName,
    required this.subCategoryId,
    required this.categoryName,
    required this.categoryId,
    required this.posId,
    required this.vendorId,
    required this.vendorName,
    required this.redeemPoint,
    required this.businessValue,
    required this.itemStatus,
    required this.qnty,
    required this.discountInPer,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['ProductName'],
      productId: json['ProductId'],
      productImage: json['ProductImage'],
      outOfStockImage: json['OutOfStockImage'],
      productType: json['ProductType'],
      productPrice: json['ProductPrice'],
      productPricee: json['ProductPricee'].toDouble(),
      afterDiscountAmount: json['AfterDiscountAmount'],
      amountAfterDiscount: json['AmountAfterDiscount'].toDouble(),
      productSetId: json['ProductSetId'],
      subCategoryName: json['SubCategoryName'],
      subCategoryId: json['SubCategoryId'],
      categoryName: json['CategoryName'],
      categoryId: json['CategoryId'],
      posId: json['PosId'],
      vendorId: json['VendorId'],
      vendorName: json['VendorName'],
      redeemPoint: json['RedeemPoint'],
      businessValue: json['BusinessValue'],
      itemStatus: json['ItemStatus'],
      qnty: json['Qnty'],
      discountInPer: json['DiscountInPer'].toDouble(),
    );
  }
}