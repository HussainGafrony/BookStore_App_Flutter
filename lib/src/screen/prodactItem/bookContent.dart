import 'package:bookStor/src/screen/BottomNavigBar/Card.dart';
import 'package:bookStor/src/screen/prodactItem/categoryTybes.dart';
import 'package:bookStor/widget/api.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SelectedBook extends StatefulWidget {
  SelectedBook({this.index});

  int index;

  @override
  _SelectedBookState createState() => _SelectedBookState();
}

class _SelectedBookState extends State<SelectedBook> {
  String book_name;
  int price;
  int stock;
  String description;
  int review;
  bool clicked = true;
  var _icon = Icons.favorite_border;
  @override
  void initState() {
    // increaseIndex();
    getBook_Content(widget.index);
    // print(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: ColorsApp().lightprimarycolor,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.52,
                        child: Image.asset('assets/images/create.jpg'),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CardPage()));
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  // color: Colors.red,
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryItem()));
                    },
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        // color: Colors.teal,
                        margin: EdgeInsets.only(
                          left: 10,
                          top: 30,
                        ),
                        child: Text(
                          book_name ?? "loading",
                          style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: ColorsApp().darkprimarycolor,
                              fontWeight: FontWeight.w600),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        // color: Colors.teal,
                        padding: EdgeInsets.only(right: 10, top: 10),
                        child: IconButton(
                          icon: Icon(_icon),
                          iconSize: 35,
                          color: (_icon == Icons.favorite_border
                              ? ColorsApp().lightprimarycolor
                              : ColorsApp().primarycolor),
                          onPressed: () {
                            setState(
                              () {
                                if (_icon == Icons.favorite_border) {
                                  _icon = Icons.favorite;
                                } else {
                                  _icon = Icons.favorite_border;
                                }
                              },
                            );
                            CardPage.card.add({
                              'bookname': book_name,
                              'price': price,
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$',
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: ColorsApp().primarycolor,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$price" ?? "loading..",
                          style: GoogleFonts.openSans(
                              fontSize: 22,
                              color: ColorsApp().primarycolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      'Review : 3/5',
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp().darkprimarycolor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      'Stock :' + " $stock" ?? "loading..",
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp().darkprimarycolor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      'Description :',
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp().darkprimarycolor,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "$description" ?? "loading..",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp().darkprimarycolor,
                        letterSpacing: 1.5,
                        height: 2,
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        top: 4, left: 10, bottom: 15, right: 10),
                    margin: EdgeInsets.only(
                        top: 15, left: 17, right: 17, bottom: 25),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorsApp().lightprimarycolor, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          height: 49,
          color: Colors.transparent,
          //color backround
          child: FlatButton(
            color: ColorsApp().primarycolor,
            onPressed: () {
              CardPage.card.add({
                'bookname': book_name,
                'price': price,
                'count': 1,
              });

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CardPage()));
            },
            child: Text(
              'Add to Cart',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorsApp().texticon,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  getBook_Content(int book_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = api.getApiUrl +
        "books/show/$book_id/?api_token=" +
        prefs.getString('api_token');
    var response = await http.get(url);

    var jsonResponse = convert.jsonDecode(response.body);
    var bookData = new Map<String, dynamic>.from(jsonResponse['attributes']);
    setState(() {
      book_name = bookData['name'];
      price = bookData['price'];
      stock = bookData['stock'];
      description = bookData['description'];
      review = bookData['review'];
    });
    // print(bookData);
    // print(book_name);
  }
}
