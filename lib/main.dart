import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Provider/vendor_provider.dart';

import 'package:flutter_ecommerce/Views/VendorListScreen.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(/*const MyApp()*/
    MultiProvider(
      providers: [
        ChangeNotifierProvider<VendorProvider>(
          create: (context) => VendorProvider(),
        ),
        // Add other providers if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent)),
      home: /*Splash()*/ VendorListScreen(),
    );
  }
}
