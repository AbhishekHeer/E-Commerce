import 'package:ecommerve/UI/bag.dart';
import 'package:ecommerve/UI/fav.dart';
import 'package:ecommerve/UI/homebody.dart';
import 'package:ecommerve/UI/profile.dart';
import 'package:ecommerve/UI/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> pages = [
  const HomeBody(),
  const ShopPage(),
  const BagPage(),
  const FavPage(),
  const ProfilePage()
];

int index = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 241, 241),
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          selectedIconTheme: const IconThemeData(color: Colors.red),
          unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
          unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
          selectedLabelStyle: const TextStyle(color: Colors.red),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag), label: 'Bag'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart_fill), label: 'favorites'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled), label: 'profile'),
          ]),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
