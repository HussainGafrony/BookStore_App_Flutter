import 'package:bookStor/src/screen/bottomitem/selectedBookScreen.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        centerTitle: false,
        backgroundColor: ColorsApp().primarycolor,
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(
            top: 25,
            left: 15,
            right: 15,
          ),
          physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
          itemCount: 24,
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
                          Text(
                            'Hussain Gafrony',
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorsApp().primarycolor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Hasan Gafrony',
                            style: GoogleFonts.openSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: ColorsApp().darkprimarycolor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$\ 45 ',
                            style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorsApp().lightprimarycolor),
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
