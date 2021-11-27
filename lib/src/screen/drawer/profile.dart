import 'package:bookStor/src/screen/api.dart';
import 'package:bookStor/widget/color_app.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool passwordVisible = true;
  bool clicked = false;
  String name;
  String email;
  String password;

  @override
  void initState() {
    super.initState();
    getUserFromPres().then((_) {
      nameController.text = name;
      emailController.text = email;
      passwordController.text = password;
    });
    print(password);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 135, top: 25),
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: CircleAvatar(
                    backgroundColor: ColorsApp().lightprimarycolor,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 227, top: 120),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(25),
                      color: ColorsApp().primarycolor,
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 26,
                      color: ColorsApp().texticon,
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 25,
            ),
            child: Text(
              'Full Name',
              style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp().darkprimarycolor),
            ),
          ),
          (name == null)
              ? Padding(
                  padding: const EdgeInsets.only(top: 15, left: 75, right: 75),
                  child: LinearProgressIndicator(
                    backgroundColor: ColorsApp().lightprimarycolor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsApp().primarycolor,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 25, top: 8, right: 25),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      showCursor: true,
                      // show |||
                      cursorColor: ColorsApp().lightprimarycolor,
                      maxLines: 1,
                      //ملاحظة عند التشغيل يعمل  خطا عند الخروج من التطبيق
                      controller: nameController,

                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp().primarycolor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsApp().lightprimarycolor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        // border: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // hintText: " Name...",
                        hintStyle: GoogleFonts.openSans(
                            color: ColorsApp().lightprimarycolor),
                        // helperText: 'Hussain'
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(
              left: 27,
              top: 25,
            ),
            child: Text(
              'Email',
              style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp().darkprimarycolor),
            ),
          ),
          (email == null)
              ? Padding(
                  padding: const EdgeInsets.only(top: 15, left: 75, right: 75),
                  child: LinearProgressIndicator(
                    backgroundColor: ColorsApp().lightprimarycolor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsApp().primarycolor,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 25, top: 8, right: 25),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      cursorColor: ColorsApp().lightprimarycolor,
                      maxLines: 1,
                      controller: emailController,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp().primarycolor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsApp().lightprimarycolor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // hintText: " Name...",
                        hintStyle: GoogleFonts.openSans(
                            color: ColorsApp().lightprimarycolor),
                        // helperText: 'Hussain'
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              top: 25,
            ),
            child: Text(
              'Password',
              style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp().darkprimarycolor),
            ),
          ),
          (password == null)
              ? Padding(
                  padding: const EdgeInsets.only(top: 15, left: 75, right: 75),
                  child: LinearProgressIndicator(
                    backgroundColor: ColorsApp().lightprimarycolor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsApp().primarycolor,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 25, top: 8, right: 25),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      cursorColor: ColorsApp().lightprimarycolor,
                      maxLines: 1,
                      obscureText: passwordVisible,
                      obscuringCharacter: '*',
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      maxLengthEnforced: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp().primarycolor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsApp().lightprimarycolor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // border: InputBorder.none,

                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorsApp().primarycolor,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),

                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        hintStyle: GoogleFonts.openSans(
                            color: ColorsApp().lightprimarycolor),
                        // helperText: 'Hussain'
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 140, top: 30, right: 140),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsApp().darkprimarycolor,
              ),
              child: FlatButton(
                onPressed: () async {
                  if (nameController.text.isEmpty) {
                    BotToast.showSimpleNotification(
                        title: 'Name empty ', duration: Duration(seconds: 4));
                  } else if (emailController.text.isEmpty) {
                    BotToast.showSimpleNotification(
                        title: 'email empty ', duration: Duration(seconds: 4));
                  } else if (passwordController.text.isEmpty) {
                    BotToast.showSimpleNotification(
                        title: 'password empty ',
                        duration: Duration(seconds: 4));
                  } else if (passwordController.text.length < 9) {
                    BotToast.showSimpleNotification(
                        title: "Password should be atleast 9 characters",
                        duration: Duration(seconds: 4));
                  }
                  setState(() {
                    clicked = true;
                  });
                  var url = api.getApiUrl + "app/register";
                  var response = await http.post(url, body: {
                    'name': nameController.text.trim(),
                    'email': emailController.text.trim(),
                    'password': passwordController.text.trim().toString(),
                  });
                  BotToast.showSimpleNotification(
                      title: ' updated ', duration: Duration(seconds: 4));
                  var jsonResponse = convert.jsonDecode(response.body);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('name', jsonResponse['name']);
                  prefs.setString('email', jsonResponse['email']);
                  prefs.setString('password', jsonResponse['password']);
                  prefs.setString('api_token', jsonResponse['api_token']);

                  // await FirebaseFirestore.instance
                  //     .collection('users')
                  //     .doc(FirebaseAuth.instance.currentUser.uid)
                  //     .update({
                  //   'name': nameController.text.trim(),
                  //   'email': emailController.text.trim(),
                  //   'password': passwordController.text.trim(),
                  // });
                },
                child: Text(
                  'Save',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  getUserFromPres() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      password = prefs.getString('password');
    });
    // getUserData() async {
    //   await FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(FirebaseAuth.instance.currentUser.uid)
    //       .get()
    //       .then((value) {
    //     setState(() {
    //       name = value.data()['name'];
    //       email = value.data()['email'];
    //       password = value.data()['password'];
    //     });
    //   });
    // }
  }
}
