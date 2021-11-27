import 'package:bookStor/src/screen/bottomitem/selectedBookScreen.dart';
import 'package:bookStor/widget/bookTabs.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatefulWidget {
  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Category Name',
            style: GoogleFonts.openSans(
              color: ColorsApp().primarycolor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GridView.builder(
            padding: EdgeInsets.all(6),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: TapsData.images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedBook()));
                  },
                  child: Card(
                    child: Image.asset(
                      TapsData.images[index],
                      fit: BoxFit.cover,
                    ),
                  ));
            }),
      ),
    );
  }
}
