import 'package:flutter/material.dart';
import 'package:grow_fast_app/pages/favorite_page.dart';
import 'package:grow_fast_app/pages/group_page.dart';
import 'package:grow_fast_app/pages/person_page.dart';
import 'package:grow_fast_app/pages/product_list_page.dart';
import 'package:grow_fast_app/pages/shopping_page.dart';

import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import '../style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  List<IndexedStackChild> list = [
    IndexedStackChild(child: const ProductListPage()),
    IndexedStackChild(child: const PersonsPage()),
    IndexedStackChild(child: const ShoppingPage()),
    IndexedStackChild(child: const FavoritePage()),
    IndexedStackChild(child: const PersonPage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProsteIndexedStack(
        index: selectIndex,
        children: list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: Style.primaryColor),
        unselectedIconTheme: const IconThemeData(color: Style.greyColor),
        currentIndex: selectIndex,
        onTap: (value) {
          selectIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),
    );
  }
}