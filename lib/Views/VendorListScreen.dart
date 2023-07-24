import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Models/CategoryProductListPage.dart';
import 'package:flutter_ecommerce/Provider/vendor_provider.dart';
import 'package:provider/provider.dart';

class VendorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vendorProvider = Provider.of<VendorProvider>(context, listen: false);
    vendorProvider.fetchVendors();

    return Scaffold(
      appBar: AppBar(title: Text('Vendor List')),
      body: Builder(
        // Wrap with Builder to get access to the correct context
        builder: (context) {
          return Consumer<VendorProvider>(
            builder: (context, vendorProvider, child) {
              if (vendorProvider.isLoading) {
                // Show a loading indicator while data is being fetched
                return Center(child: CircularProgressIndicator());
              } else if (vendorProvider.vendors.isEmpty) {
                // Show a message when no vendors are found
                return Center(child: Text('No vendors found.'));
              } else {
                // Display the vendor data
                return Container(
                  color: Colors.grey[200],
                  child: ListView.builder(
                    itemCount: vendorProvider.vendors.length,
                    itemBuilder: (context, index) {
                      final vendor = vendorProvider.vendors[index];
                      return ListTile(
                          leading: Image.network(vendor.pictureUrl),
                          title: Text(vendor.name),
                          subtitle: Text(vendor.address),
                          trailing: Text(vendor.distance),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryProductListPage(
                                    vendorId: vendor.vendorId),
                              ),
                            );
                          });
                    },
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
