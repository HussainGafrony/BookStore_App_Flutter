import 'package:bookStor/src/screen/BottomNavigBar/Card.dart';
import 'package:bookStor/src/screen/prodactItem/bookContent.dart';
import 'package:bookStor/widget/api.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        centerTitle: false,
        backgroundColor: ColorsApp().primarycolor,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(
            top: 25,
            left: 15,
            right: 15,
          ),
          physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
          itemCount: CardPage.card.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectedBook()));
              },
              child: Container(
                // color: Colors.black38,
                //color box backend
                margin: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Card(
                  // margin: EdgeInsets.only(left: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.20,
                        decoration: BoxDecoration(
                          // color: Colors.teal,
                          //color box backend
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images/create.jpg')),
                        ),
                      ),
                      SizedBox(
                        width: 41,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              // color: Colors.red,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                CardPage.card[index]['bookname'],
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: ColorsApp().primarycolor),
                                maxLines: 2,
                              ),
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
                                CardPage.card[index]['price'].toString(),
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
            );
          }),
    );
  }
}
