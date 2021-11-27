import 'package:bookStor/src/screen/bottomitem/Card.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedBook extends StatefulWidget {
  @override
  _SelectedBookState createState() => _SelectedBookState();
}

class _SelectedBookState extends State<SelectedBook> {
  bool clicked = true;
  int currentAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                // backgroundColor: Colors.deepOrange,
                // color backround
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                floating: true,
                // زيادة scrollمن الاعلى و الاسفل
                // pinned: true,
                //تظهر appBar

                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: ColorsApp().lightprimarycolor,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            right: 20,
                            top: 20,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CardPage()));
                              },
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          // Positioned(
                          //   right: 11,
                          //   top: 4,
                          //   child: Container(
                          //     height: 25,
                          //     width: 25,
                          //     decoration: BoxDecoration(
                          //       color: ColorsApp().primarycolor,
                          //       borderRadius: BorderRadius.circular(12),
                          //     ),
                          //   ),
                          // ),
                          // Positioned(
                          //   right: 16,
                          //   top:8,
                          //   child: Text(
                          //     "$currentAmount",
                          //     style: GoogleFonts.openSans(
                          //       fontSize: 11,
                          //       color: Colors.white,
                          //
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 60),
                          width: MediaQuery.of(context).size.width * 0.50,
                          height: MediaQuery.of(context).size.height * 0.27,
                          decoration: BoxDecoration(
                            // color: ColorsApp().primarycolor,
                            // color backround
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/images/create.jpg'),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22, left: 25),
                        child: Text(
                          'You\'re A Miracle',
                          style: GoogleFonts.openSans(
                              fontSize: 27,
                              color: ColorsApp().darkprimarycolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: clicked == false
                              ? ColorsApp().lightprimarycolor
                              : ColorsApp().primarycolor,
                          iconSize: 35,
                          onPressed: () {
                            clicked = true;
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 25),
                    child: Text(
                      'Mike McHague',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: ColorsApp().primarycolor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$',
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: ColorsApp().lightprimarycolor,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '20',
                          style: GoogleFonts.openSans(
                              fontSize: 32,
                              color: ColorsApp().lightprimarycolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 28,
                    margin: EdgeInsets.only(top: 23, bottom: 36),
                    padding: EdgeInsets.only(left: 25),
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                          indicatorWeight: 1.5,
                          indicatorColor: Colors.transparent,
                          labelPadding: EdgeInsets.all(0),
                          isScrollable: true,
                          labelColor: ColorsApp().darkprimarycolor,
                          unselectedLabelColor: ColorsApp().lightprimarycolor,
                          labelStyle: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          unselectedLabelStyle: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          // indicator: BoxDecoration(),

                          tabs: [
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 40, left: 0),
                                child: Text('Description'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 40),
                                child: Text('Reviews'),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Text(
                      ' codeEven bad code can function. But if code  it can bring a development organization to codeEven bad codecodeEven bad code can function. But if code  it can bring a development organization to  can function. But if code  it can bring a development organization to its knees Every year countless hours and significant resources are lost because of poorly written code',
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp().lightprimarycolor,
                          letterSpacing: 1.5,
                          height: 2),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.transparent,
        //color backround
        child: FlatButton(
          color: ColorsApp().primarycolor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CardPage()));
            setState(() {
              // currentAmount += 1;
              // currentAmount = 0;
            });
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
    );
  }
}
