import 'package:bookStor/src/screen/bottomitem/category.dart';
import 'package:bookStor/src/screen/bottomitem/favorite.dart';
import 'package:bookStor/src/screen/bottomitem/homescreen.dart';

import 'package:bookStor/src/screen/bottomitem/Card.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';

class ItemSelect extends StatefulWidget {
  @override
  _ItemSelectState createState() => _ItemSelectState();
}

class _ItemSelectState extends State<ItemSelect> {
  @override
  int tabindex = 0;
  List<Widget> listscreen = [HomeScreen(),Favorite(), CardPage(),CategoryType(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listscreen[tabindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsApp().primarycolor,
        onTap: (int index) {
          setState(() {
            tabindex = index;

          });
        },
        currentIndex: tabindex,
        fixedColor: ColorsApp().lightprimarycolor,
        unselectedItemColor: ColorsApp().texticon,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'BOOKS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'FAVORITE',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'CATEGORY',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'PROFILE',
          // ),
        ],
      ),
    );
  }
}
