import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TapsData extends StatefulWidget {
  static List images = [
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
    "assets/images/z.jpg",
    "assets/images/d.jpg",
  ];

  @override
  _TapsDataState createState() => _TapsDataState();
}

class _TapsDataState extends State<TapsData> {
  List<Tab> myTabs = [
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23, left: 0),
        child: Text('Classics'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('Comic'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('Drama'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('Fantasy'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('romance'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('Science'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('fiction'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('Horror'),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text('Historical'),
      ),
    ),
  ];

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(top: 10),
      child: DefaultTabController(
        length: myTabs.length,
        // initialIndex: 0,
        child: Scaffold(
          backgroundColor: ColorsApp().texticon,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: ColorsApp().texticon,
            elevation: 0,
            bottom: TabBar(
              // indicatorWeight: 1.5,
              // indicatorColor: ColorsApp().texticon,
              labelPadding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              isScrollable: true,
              labelColor: ColorsApp().primarycolor,
              unselectedLabelColor: ColorsApp().lightprimarycolor,
              labelStyle: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              // indicator: BoxDecoration(),

              tabs: myTabs,
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              BarView(),
              BarView(),
              BarView(),
              BarView(),
              BarView(),
              BarView(),
              BarView(),
              BarView(),
              BarView(),
            ],
          ),
        ),
      ),
    );
  }
}

class BarView extends StatefulWidget {
  @override
  _BarViewState createState() => _BarViewState();
}

class _BarViewState extends State<BarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 2),
      child: ListView.builder(
          padding: EdgeInsets.only(left: 10, right: 0),
          //ازاحة الى الجانب اليمين
          itemCount: TapsData.images.length,
          //data image api
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          //physcics تعطي سكرول في الزوايا
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 25),
              width: MediaQuery.of(context).size.width * 0.37,
              decoration: BoxDecoration(
                // color: Colors.red,
                //color box
                image:
                    DecorationImage(image: AssetImage(TapsData.images[index])),

                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
    );
  }
}
