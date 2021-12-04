import 'package:bookStor/src/screen/prodactItem/bookContent.dart';
import 'package:bookStor/widget/api.dart';

import 'package:bookStor/widget/bookTabs.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem({this.index});

  int index;

  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  List books = [];
  String categoryName;

  @override
  void initState() {
    increaseIndex();

    getBooks_with_category(widget.index);
    getCategoriesname(widget.index);

    print(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            categoryName ?? "loading..",
            style: GoogleFonts.openSans(
              color: ColorsApp().primarycolor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GridView.builder(
            padding: EdgeInsets.all(8),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              mainAxisSpacing: 2,
              crossAxisSpacing: 14,
            ),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SelectedBook(index: books[index]['id'])));
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: Image.asset(BarView.images[index]),
                        // color: Colors.black,
                        // backround
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 3),
                        width: MediaQuery.of(context).size.width * 0.4,
                        // color: Colors.yellowAccent,
                        child: Text(
                          books[index]['name'] ?? "loading..",
                          style: GoogleFonts.openSans(
                              color: ColorsApp().primarycolor,
                              fontSize: 12,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  getBooks_with_category(int category_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = api.getApiUrl +
        "categories/getBookTypeCategory/$category_id/?api_token=" +
        prefs.getString('api_token');

    var response = await http.get(url);

    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      books.addAll(jsonResponse);
    });
    // print(books);
    // print(books[0]['id']);
  }

  getCategoriesname(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = api.getApiUrl +
        "categories/show/$id/?api_token=" +
        prefs.getString('api_token');

    var response = await http.get(url);

    var jsonResponse = convert.jsonDecode(response.body);
    var categoryData = new Map<String, dynamic>.from(jsonResponse);

    setState(() {
      categoryName = categoryData['type'];
      // book_id = categoryData['id'];
    });
    // print(categoryName.toString());
    // print (book_id);
  }

  increaseIndex() {
    if (widget.index < 12) {
      widget.index++;
    }
  }
}
