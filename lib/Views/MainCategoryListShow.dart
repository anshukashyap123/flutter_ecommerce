import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Models/TransactionDetails.dart';
import 'package:flutter_ecommerce/Provider/vendor_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class VendorAccountList extends StatelessWidget {
  Future<List<TransactionDetails>> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://brotherlike-navies.000webhostapp.com/people/people.php'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => TransactionDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vendor List')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  width: 319,
                  height: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text(
                    '\$5200.00',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  width: 319,
                  height: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text(
                    '\$1200.00',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Recent Transactions",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          Center(
            child: FutureBuilder<List<TransactionDetails>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                                snapshot.data![index].avatar.toString()),
                          ),
                          title: Text(snapshot.data![index].name.toString()),
                          trailing: Text(snapshot.data![index].amount.toString()),
                          subtitle: Text(snapshot.data![index].date.toString()),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
