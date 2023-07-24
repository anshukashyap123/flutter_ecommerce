import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Provider/vendor_provider.dart';
import 'package:provider/provider.dart';



class CategoryProductListPage extends StatelessWidget {
  final int vendorId;

  CategoryProductListPage({required this.vendorId});

  @override
  Widget build(BuildContext context) {
    final vendorProvider = Provider.of<VendorProvider>(context, listen: false);
    // Call the method to fetch categories for the specified vendor
    vendorProvider.fetchCategoriesByVendorId(vendorId);


    return Scaffold(
      appBar: AppBar(title: Text('Category List')),
      body: Row(
        children: [
          // Category List - One-third of the width
          Expanded(
            flex: 1,
            child: Builder(
              builder: (context) {
                return Consumer<VendorProvider>(
                  builder: (context, vendorProvider, child) {
                    if (vendorProvider.isCategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (vendorProvider.categories.isEmpty) {
                      return Center(child: Text('No categories found.'));
                    } else {
                      return Container(
                        color: Colors.grey[200],
                        child: ListView.builder(
                          itemCount: vendorProvider.categories.length,
                          itemBuilder: (context, index) {
                            final category = vendorProvider.categories[index];
                            return ListTile(
                              title: Text(category.categoryName,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                              subtitle: Column(
                                children: [
                                  SizedBox(
                                    height: 4,
                                    width: 2,
                                  ),
                                  Image.network(category.categoryImage),
                                  // Category Image
                                  SizedBox(
                                    height: 4,
                                    width: 2,
                                  ),
                                ],
                              ),
                              onTap: () {
                               /* if (!vendorProvider.isProductLoading &&
                                    vendorProvider.products.isEmpty) {
                                  vendorProvider.fetchProductsByCategoryVendorId(
                                    "28304",
                                    category.categoryId.toString(),
                                    181,
                                  );
                                }*/
                                vendorProvider.fetchProductsByCategoryVendorId(
                                  "28304",
                                  category.categoryId.toString(),
                                  vendorId,
                                );
                              },
                            );
                          },
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),

          // Products List - Two-thirds of the width
          Expanded(
            flex: 3,
            child: ProductListPage(),
          ),
        ],
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VendorProvider>(
      builder: (context, vendorProvider, child) {
        // Fetch products if not already loaded
      /*  if (!vendorProvider.isProductLoading &&
            vendorProvider.products.isEmpty) {
          vendorProvider.fetchProductsByCategoryVendorId(
            "28304",
            "275",
            181,
          );
        }*/

        // Show loading indicator while products are being fetched
        if (vendorProvider.isProductLoading) {
          return Center(child: CircularProgressIndicator());
        }

        // Show the product list
        if (vendorProvider.products.isNotEmpty) {
          return Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: vendorProvider.products.length,
              itemBuilder: (context, index) {
                final product = vendorProvider.products[index];
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Image.network(product.productImage),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.productName),
                        SizedBox(height: 8), // Add some spacing
                        Text(
                          'Price: \$${product.productPricee}',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8), // Add some spacing
                        product.qnty > 0
                            ? Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // TODO: Implement minus quantity functionality
                                      print(
                                          'Minus quantity: ${product.productName}');
                                    },
                                    child: Icon(Icons.remove),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(2),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    product.qnty.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {

                                      print(
                                          'Plus quantity: ${product.productName}');
                                    },
                                    child: Icon(Icons.add),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(2),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 80, // <-- Your width
                                height: 25,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    bool status =
                                        await vendorProvider.addToCart(
                                            product.productId,
                                            product.vendorId,product.posId);
                                    if (status) {
                                      // API call successful, now update the quantity and re-fetch products
                                    /*  vendorProvider.updateProductQuantity(
                                          product.productId, 1);*/
                                      vendorProvider
                                          .fetchProductsByCategoryVendorId(
                                        "28304",
                                        product.categoryId.toString(),
                                        181,
                                      );
                                    } else {
                                      // API call failed, show an error message or handle it accordingly
                                      print('Failed to add to cart.');
                                    }
                                  },
                                  child: Text('Add'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6), // Adjust the button size
                                  ),
                                ),
                              ),
                      ],
                    ),
                    onTap: () {
                      // You can also handle product details screen here if needed
                      print('Selected Product: ${product.productName}');
                    },
                  ),
                );
              },
            ),
          );
        }

        // Show a message when no products are found
        return Center(child: Text('No products found.'));
      },
    );
  }
}
