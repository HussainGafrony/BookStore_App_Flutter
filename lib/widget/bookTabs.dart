import 'package:bookStor/widget/api.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TapsData extends StatefulWidget {


  @override
  _TapsDataState createState() => _TapsDataState();
}

class _TapsDataState extends State<TapsData> {
  String tab1,
      tab2,
      tab3,
      tab4,
      tab5,
      tab6,
      tab7,
      tab8,
      tab9,
      tab10,
      tab11,
      tab12,
      loading = 'Loading....';

  @override
  void initState() {

    getCategories();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(top: 10),
      child: DefaultTabController(
        length: 12,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab1 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab2 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab3 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab4 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab5 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab6 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab7 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab8 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab9 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab10 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab11 ?? loading),
                  ),
                ),
                Tab(
                  child: Container(
                    margin: EdgeInsets.only(right: 23),
                    child: Text(tab12 ?? loading),
                  ),
                ),
              ],
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
              BarView(),
              BarView(),
              BarView(),
            ],
          ),
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
      tab1 = jsonResponse[0]['title'];
      tab2 = jsonResponse[1]['title'];
      tab3 = jsonResponse[2]['title'];
      tab4 = jsonResponse[3]['title'];
      tab5 = jsonResponse[4]['title'];
      tab6 = jsonResponse[5]['title'];
      tab7 = jsonResponse[6]['title'];
      tab8 = jsonResponse[7]['title'];
      tab9 = jsonResponse[8]['title'];
      tab10 = jsonResponse[9]['title'];
      tab11 = jsonResponse[10]['title'];
      tab12 = jsonResponse[11]['title'];
    });
  }


}

class BarView extends StatefulWidget {
  static List images = [
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
    "assets/images/type1.jpg",
    "assets/images/type3.jpg",
  ];

  @override
  _BarViewState createState() => _BarViewState();
}

class _BarViewState extends State<BarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,

      child: ListView.builder(
          padding: EdgeInsets.only(left: 10, right: 0),
          itemCount: BarView.images.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                right: 25,
              ),
              width: MediaQuery.of(context).size.width * 0.30,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(BarView.images[index]),
              ),
            );
          }),
    );
  }
}
