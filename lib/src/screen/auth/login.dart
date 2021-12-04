import 'package:bookStor/src/screen/BottomNavigBar/itemselect.dart';
import 'package:bookStor/widget/api.dart';
import 'package:bookStor/src/screen/auth/createAccuont.dart';

import 'package:bookStor/widget/color_app.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode passwordFocus = FocusNode();
  bool passwordVisible = true;
  bool clicked = false;
  var _serviceEnabled;
  var _permissionGranted;
  int count = 1;

  @override
  void initState() {
    super.initState();
    checkLocationAvailability();
  }

  @override
  void dispose() {
    passwordFocus.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.32,
              child: Image.asset(
                'assets/images/login.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.646,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    // color: Color.fromRGBO(244, 180, 93, 1),
                    color: ColorsApp().lightprimarycolor),
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 85,
                      ),
                      child: Text(
                        'Welcome To Book App',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: ColorsApp().primarycolor
                            // color: Color.fromRGBO(55, 42, 83, 1),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Container(
                        height: 55,
                        child: TextFormField(
                          cursorColor: ColorsApp().lightprimarycolor,
                          autocorrect: true,
                          maxLines: 1,
                          autofocus: true,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorsApp().primarycolor),
                          onFieldSubmitted: (_) => passwordFocus.requestFocus(),
                          textInputAction: TextInputAction.send,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorsApp().lightprimarycolor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
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
                          ),
                        ),
                      ),
                    ),
                    // emailTextFormField

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Container(
                        height: 55,
                        child: TextFormField(
                          focusNode: passwordFocus,
                          cursorColor: ColorsApp().lightprimarycolor,
                          maxLines: 1,
                          enabled: true,
                          obscureText: passwordVisible,
                          obscuringCharacter: '*',
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          controller: passwordController,
                          maxLengthEnforced: true,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorsApp().primarycolor),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorsApp().lightprimarycolor,
                                  width: 1),
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
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: " password...",
                            hintStyle: GoogleFonts.openSans(
                                color: ColorsApp().lightprimarycolor),
                          ),
                        ),
                      ),
                    ),
                    // emailTextFormField
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot your password ?',
                          style: TextStyle(
                              color: ColorsApp().texticon,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 130, right: 130),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: (clicked == false)
                            ? RaisedButton(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                onPressed: () async {

                                  if (emailController.text.isEmpty) {
                                    BotToast.showSimpleNotification(
                                        title: 'email empty ',
                                        duration: Duration(seconds: 4));
                                  } else if (passwordController.text.isEmpty) {
                                    BotToast.showSimpleNotification(
                                        title: 'password empty ',
                                        duration: Duration(seconds: 4));
                                  }
                                  setState(() {
                                    clicked =true;
                                  });
                                  var url = api.getApiUrl + "app/login";

                                  var response = await http.post(url, body: {
                                    'email': emailController.text,
                                    'password': passwordController.text,
                                  });

                                  var jsonResponse =
                                      convert.jsonDecode(response.body);
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('name', jsonResponse['name']);
                                  prefs.setString(
                                      'email', jsonResponse['email']);
                                  prefs.setString(
                                      'api_token', jsonResponse['api_token']);

                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ItemSelect()),
                                  );


                                },
                                color: ColorsApp().darkprimarycolor,
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      ColorsApp().primarycolor),
                                ),
                              ),
                      ),
                    ),
                    // Sign in
                    SizedBox(
                      height: 1,
                    ),
                    divider(),
                    Padding(
                      padding: EdgeInsets.only(left: 132, right: 128),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: RaisedButton(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                          },
                          color: ColorsApp().darkprimarycolor,
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorsApp().texticon),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 1,
                color: ColorsApp().darkprimarycolor,
              ),
            ),
          ),
          Text(
            'or',
            style: GoogleFonts.openSans(
              color: ColorsApp().texticon,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 1,
                color: ColorsApp().darkprimarycolor,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
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
