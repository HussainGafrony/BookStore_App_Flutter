import 'package:bookStor/src/screen/auth/login.dart';
import 'package:bookStor/src/screen/drawer/about.dart';
import 'package:bookStor/src/screen/bottomitem/favorite.dart';
import 'package:bookStor/src/screen/drawer/profile.dart';
import 'package:bookStor/src/screen/drawer/maps.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawer2 extends StatefulWidget {
  @override
  _Drawer2State createState() => _Drawer2State();
}

class _Drawer2State extends State<Drawer2> {
  String name;

  String image =
      ('https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80');

  @override
  void initState() {
    super.initState();
    // getUserData();
    getUserFromPres();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (image == null)
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ColorsApp().primarycolor,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundColor: ColorsApp().lightprimarycolor,
                            backgroundImage: NetworkImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: (name == null)
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            ColorsApp().primarycolor,
                          ),
                        )
                      : Text(
                          '$name',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: ColorsApp().darkprimarycolor,
                          ),
                        ),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  thickness: 0.3,
                  color: ColorsApp().darkprimarycolor,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            Column(
              children: [
                iconModel(Icons.person, 'Profile', () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                }),
                iconModel(Icons.location_on, 'Location', () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Maps()));
                }),
                iconModel(Icons.favorite, 'FAVORITE ', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favorite()));
                }),
                iconModel(Icons.info, 'ABOUT', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                }),
                iconModel(
                  Icons.logout,
                  'Log Out',
                  () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();

                    prefs.clear();
                    // await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getUserFromPres() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('name');
    });

    print(prefs.getString('api_token'));
  }

  // getUserData() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       name = value.data()['name'];
  //     });
  //   });
  // }

  iconModel(IconData icon, String text, VoidCallback press) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          child: FlatButton(
            height: 40,
            onPressed: press,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white38,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: ColorsApp().primarycolor,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.openSans(
                        fontSize: 14, color: ColorsApp().primarycolor),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorsApp().primarycolor,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
