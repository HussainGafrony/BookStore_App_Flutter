import 'package:bookStor/src/screen/bottomitem/category_item.dart';
import 'package:bookStor/widget/bookTabs.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryType extends StatefulWidget {


  @override
  _CategoryTypeState createState() => _CategoryTypeState();
}

class _CategoryTypeState extends State<CategoryType> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Category',
            style: GoogleFonts.openSans(
              color: ColorsApp().primarycolor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: GridView.builder(
              padding: EdgeInsets.all(6),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 8),
              itemCount: 16,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryItem()));
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(TapsData.images[index]),
                            fit: BoxFit.cover,
                            colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.darken),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: "Title1",
                            style: TextStyle(
                                color: ColorsApp().darkprimarycolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

