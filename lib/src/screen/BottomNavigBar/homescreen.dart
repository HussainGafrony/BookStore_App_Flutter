import 'package:bookStor/src/screen/drawer/drawer.dart';
import 'package:bookStor/src/screen/prodactItem/bookContent.dart';
import 'package:bookStor/widget/api.dart';
import 'package:bookStor/widget/bookTabs.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List books = [];
  int selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getBooks_with_category(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: ColorsApp().primarycolor),
          elevation: 0,
        ),
        drawer: Drawer2(),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorsApp().primarycolor),
                    ),
                    Text(
                      'Discover Latest Book',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: ColorsApp().primarycolor),
                    ),
                    Container(
                      height: 39,
                      margin: EdgeInsets.only(left: 2, right: 20, top: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Stack(
                        children: [
                          TextField(
                            maxLengthEnforced: true,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: ColorsApp().primarycolor),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 19, right: 50, bottom: 8),
                              border: InputBorder.none,
                              hintText: 'Search book.. ',
                              hintStyle: GoogleFonts.openSans(
                                  color: ColorsApp().lightprimarycolor),
                              helperStyle: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // TextField Search
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 40,
                              height: 39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorsApp().primarycolor),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 9,
                            child: Icon(
                              Icons.search,
                              color: ColorsApp().texticon,
                            ),
                          ),
                          // Search place
                        ],
                      ),
                    ),
                    TapsData(),
                    // Body Category Types

                    Padding(
                      padding: const EdgeInsets.only( top: 12),
                      child: Text(
                        'Popular',
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorsApp().primarycolor),
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.only(
                          top: 15,

                          right: 25,
                        ),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectedBook(index:books[index]['id'],)));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 50, ),
                              child: Container(
                                // color: Colors.black38,
                                //color box backend
                                margin: EdgeInsets.only(
                                  bottom: 15,
                                ),
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          //color box backend
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/create.jpg')),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            // color: Colors.teal,

                                            child: Text(
                                              books[index]['name'] ?? "loading",
                                              style: GoogleFonts.openSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      ColorsApp().primarycolor),maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$',
                                                style: GoogleFonts.openSans(
                                                    fontSize: 16,
                                                    color: ColorsApp().primarycolor,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                "${books[index]['price']}" ?? "loading",
                                                style: GoogleFonts.openSans(
                                                    fontSize: 16,
                                                    color: ColorsApp().lightprimarycolor,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    //  one Book Content
                  ]),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 30,
            ),
            backgroundColor: ColorsApp().primarycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            onPressed: () {
              showActionSnackBar();
            }),
      ),
    );
  }

  select(value) {
    setState(() {
      selectedIndex = value;
    });
  }

  void showActionSnackBar() {
    final snackBar = SnackBar(
      backgroundColor: ColorsApp().darkprimarycolor,
      content: Text(
        'Welcome to Book App',
        style: TextStyle(fontSize: 16),
      ),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Hide',
        onPressed: () {},
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
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
}
