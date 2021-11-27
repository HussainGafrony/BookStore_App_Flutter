import 'package:bookStor/src/screen/api.dart';
import 'package:bookStor/src/screen/bottomitem/itemselect.dart';

import 'package:bookStor/widget/color_app.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool passwordVisible = true;

  bool clicked = false;
  var _serviceEnabled;
  var _permissionGranted;

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    gettoken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().texticon,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 25,
            ),
            child: Image.asset(
              'assets/images/book.jpg',
              height: MediaQuery.of(context).size.height * 0.42,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Padding(
              padding: EdgeInsets.only(top: 4),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: TextFormField(
                      autocorrect: true,
                      maxLines: 1,
                      enabled: true,
                      autofocus: true,
                      cursorColor: ColorsApp().lightprimarycolor,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp().darkprimarycolor),
                      onFieldSubmitted: (_) => emailFocus.requestFocus(),
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorsApp().texticon,

                        // border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsApp().lightprimarycolor, width: 1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: "  Name ...",
                        hintStyle: GoogleFonts.openSans(
                            color: ColorsApp().lightprimarycolor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      cursorColor: ColorsApp().lightprimarycolor,
                      autocorrect: true,
                      maxLines: 1,
                      enabled: true,
                      autofocus: true,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocus,
                      onFieldSubmitted: (_) => passwordFocus.requestFocus(),
                      textInputAction: TextInputAction.send,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp().darkprimarycolor),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsApp().lightprimarycolor, width: 1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        filled: true,
                        fillColor: ColorsApp().texticon,
                        // border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.mail_outlined,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: " Email...",
                        hintStyle: GoogleFonts.openSans(
                            color: ColorsApp().lightprimarycolor),
                        // helperText: 'Hussain'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      cursorColor: ColorsApp().lightprimarycolor,
                      autocorrect: true,
                      maxLines: 1,
                      enabled: true,
                      autofocus: true,
                      obscureText: passwordVisible,
                      obscuringCharacter: '*',
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      textInputAction: TextInputAction.send,
                      inputFormatters: [LengthLimitingTextInputFormatter(9)],
                      maxLengthEnforced: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp().darkprimarycolor),
                      focusNode: passwordFocus,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsApp().lightprimarycolor, width: 1),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        prefixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: ColorsApp().texticon,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: " password...",
                        hintStyle: GoogleFonts.openSans(
                            color: ColorsApp().lightprimarycolor),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  (clicked == false)
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: ColorsApp().darkprimarycolor,
                          ),
                          width: 125,
                          height: 42,
                          child: FlatButton(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                if (nameController.text.isEmpty) {
                                  BotToast.showSimpleNotification(
                                      title: 'Name empty ',
                                      duration: Duration(seconds: 4));
                                }
                                if (emailController.text.isEmpty) {
                                  BotToast.showSimpleNotification(
                                      title: 'email empty ',
                                      duration: Duration(seconds: 4));
                                }
                                if (passwordController.text.isEmpty) {
                                  BotToast.showSimpleNotification(
                                      title: 'password empty ',
                                      duration: Duration(seconds: 4));
                                }

                                setState(() {
                                  clicked = true;
                                });
                                var url = api.getApiUrl + "app/register";
                                var response = await http.post(url, body: {
                                  'name': nameController.text,
                                  'email': emailController.text,
                                  'password': passwordController.text,
                                });

                                var jsonResponse =
                                    convert.jsonDecode(response.body);
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('name', jsonResponse['name']);
                                prefs.setString('email', jsonResponse['email']);
                                prefs.setString(
                                    'api_token', jsonResponse['api_token']);

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ItemSelect()));
                              }),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                ColorsApp().primarycolor),
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

  gettoken() async {
    return await firebaseMessaging.getToken();
  }

  checkLocationAvailability() async {
    Location location = new Location();

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (_serviceEnabled) {
        _permissionGranted = await location.hasPermission();

        if (_permissionGranted != PermissionStatus.granted) {
          _permissionGranted = await location.requestPermission();

          if (_permissionGranted != PermissionStatus.granted) {
            SystemNavigator.pop();
          }
        }
      } else {
        SystemNavigator.pop();
      }
    } else {
      _permissionGranted = await location.hasPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        _permissionGranted = await location.requestPermission();

        if (_permissionGranted != PermissionStatus.granted) {
          SystemNavigator.pop();
        }
      }
    }
  }
}
