import 'package:flutter_ecommerce/Const/consts.dart';
import 'package:flutter_ecommerce/Const/strings.dart';
import 'package:flutter_ecommerce/Dashboard_screen/CartScreen.dart';
import 'package:flutter_ecommerce/Dashboard_screen/CategoriesScreen.dart';
import 'package:flutter_ecommerce/Dashboard_screen/HomeScreen.dart';
import 'package:flutter_ecommerce/Dashboard_screen/ProfileScreen.dart';
import 'package:flutter_ecommerce/Dashboard_screen/CartScreen.dart';
import 'package:flutter_ecommerce/Dashboard_screen/ProfileScreen.dart';
import 'package:flutter_ecommerce/Dashboard_screen/HomeScreen.dart';
import 'package:flutter_ecommerce/Dashboard_screen/CategoriesScreen.dart';
import 'package:flutter_ecommerce/controllers/home_controller.dart';
import 'package:flutter_ecommerce/Const/colors.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: Category),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: Cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: Account),
    ];

    var navBody = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
          //obx function use to move replace widgets
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.red,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
