import 'package:bookStor/src/screen/prodactItem/categoryTybes.dart';
import 'package:bookStor/widget/api.dart';
import 'package:bookStor/widget/bookTabs.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CategoryType extends StatefulWidget {

  @override
  _CategoryTypeState createState() => _CategoryTypeState();
}

class _CategoryTypeState extends State<CategoryType> {
  List categories = [];

  @override
  void initState() {

    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Category',
            style: GoogleFonts.openSans(
                color: ColorsApp().darkprimarycolor,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(6),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryItem(
                                index: index,
                              )),
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.19,
                          width: MediaQuery.of(context).size.width * 0.32,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            // backround
                            image: DecorationImage(
                              image: AssetImage(BarView.images[index]),
                              // fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                  ColorsApp().texticon, BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.4,
                          // color: Colors.yellowAccent,
                          child: Text(
                            categories[index]['title'],
                            style: TextStyle(
                              color: ColorsApp().darkprimarycolor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = api.getApiUrl +
        "categories/index?api_token=" +
        prefs.getString('api_token');

    var response = await http.get(url);

    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      categories.addAll(jsonResponse);
    });
    // print(categories.length);
  }



}
