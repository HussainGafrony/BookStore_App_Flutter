import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatefulWidget {
  static List card = [];
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: GoogleFonts.openSans(
              color: ColorsApp().darkprimarycolor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: CardPage.card.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, bottom: 5),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            // color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 8,
                                left: 5,
                                top: 5,
                                bottom: 5,
                              ),
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                // color: Colors.teal,
                                // color box backend
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/create.jpg')),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    // color: Colors.red,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
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
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsApp().lightprimarycolor,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      CardPage.card[index]['count']--;
                                    });
                                    if (CardPage.card[index]['count'] < 0) {
                                      CardPage.card[index]['count'] = 0;
                                    }
                                  },
                                ),
                                SizedBox(width: 7),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: ColorsApp().primarycolor,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      CardPage.card[index]['count'].toString(),
                                      style: GoogleFonts.openSans(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  child: Container(
                                    // padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsApp().lightprimarycolor,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      CardPage.card[index]['count']++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    //
    // Padding(
    //   padding: const EdgeInsets.only(top: 430),
    //   child: Divider(
    //     color: ColorsApp().primarycolor,
    //   ),
    // ),
    // Container(
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 25, right: 25),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.end,
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text("TOTAL",
    //                 style: Theme
    //                     .of(context)
    //                     .textTheme
    //                     .bodyText1),
    //             Text(
    //               "USD. 899.01",
    //               style: GoogleFonts.openSans(
    //                   fontSize: 22, fontWeight: FontWeight.bold),
    //             ),
    //           ],
    //         ),
    //         Container(
    //           height: 50,
    //           child: RaisedButton(
    //             child: Text(
    //               "CHECKOUT",
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 15,
    //               ),
    //             ),
    //             onPressed: () {},
    //             color: ColorsApp().darkprimarycolor,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(15.0),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   ),
    //   ],
    // ),
    // ),);
  }
}
