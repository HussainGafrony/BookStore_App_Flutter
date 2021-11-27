
import 'package:bookStor/widget/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
   int _currentAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp().primarycolor,
        title: Text('Cart'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                ),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.91,
                    decoration: BoxDecoration(
                        // color: Colors.black38,
                        ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: BoxDecoration(
                            // color: Colors.teal,
                            //color box backend
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/create.jpg')),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                'Hussain ',
                                style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: ColorsApp().primarycolor),
                              ),
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
                        SizedBox(
                          width: 80,
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
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
                                  _currentAmount --;
                                });
                                if(_currentAmount<0){
                                  _currentAmount = 0;
                                }

                              },
                            ),
                            SizedBox(width: 7),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: ColorsApp().primarycolor,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Center(
                                child: Text(
                                  "$_currentAmount",
                                  style: GoogleFonts.openSans(
                                      fontSize: 18, fontStyle: FontStyle.italic,
                                  color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
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
                                  _currentAmount ++;
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
          Padding(
            padding: const EdgeInsets.only(top: 380),
            child: Divider(
              color: ColorsApp().primarycolor,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("TOTAL",
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(
                        "USD. 899.01",
                        style: GoogleFonts.openSans(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        "CHECKOUT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {},
                      color: ColorsApp().darkprimarycolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
