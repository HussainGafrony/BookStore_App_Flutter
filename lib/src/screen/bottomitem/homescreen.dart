import 'package:bookStor/src/screen/drawer/drawer.dart';
import 'package:bookStor/src/screen/bottomitem/selectedBookScreen.dart';
import 'package:bookStor/widget/bookTabs.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorsApp().texticon,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'welcome',
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
                        contentPadding:
                            EdgeInsets.only(left: 19, right: 50, bottom: 8),
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
                  ],
                ),
              ),
              TapsData(),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
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
                    top: 20,
                    left: 5,
                    right: 25,
                  ),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 24,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedBook()));
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SelectedBook()),
                        //     (route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50,left: 5),
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
                                      MediaQuery.of(context).size.height * 0.10,
                                  width: MediaQuery.of(context).size.width * 0.20,
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    //color box backend
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/create.jpg')),
                                  ),
                                ),
                                SizedBox(
                                  width: 21,
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
                      ),
                    );
                  }),
            ]),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          elevation: 0,
          backgroundColor: ColorsApp().primarycolor,
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            BotToast.showSimpleNotification(title: "Welcome to Book Store");
          }),
    );
  }


  select(value) {
    setState(() {
      selectedIndex = value;
    });
  }

}
