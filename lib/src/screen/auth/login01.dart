// import 'package:bookStor/src/screen/auth/createAccuont.dart';
// import 'package:bookStor/src/screen/auth/resetpassword.dart';
// import 'package:bookStor/src/screen/bottomitem/itemselect.dart';
// import 'package:bookStor/widget/color_app.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   FocusNode passwordFocus = FocusNode();
//   String errorMessage;
//   bool passwordVisible = true;
//   bool clicked = false;
//   var _serviceEnabled;
//   var _permissionGranted;
//   LatLng locationData;
//
//   @override
//   void initState() {
//     super.initState();
//     passwordFocus = FocusNode();
//     gettoken();
//     checkLocationAvailability().then((_) async {
//       await getCustomerLocation();
//     });
//   }
//
//   @override
//   void dispose() {
//     passwordFocus.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           Container(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.32,
//             child: Image.asset(
//               'assets/images/login.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.67,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(35),
//                     topRight: Radius.circular(35),
//                   ),
//                   // color: Color.fromRGBO(244, 180, 93, 1),
//                   color: ColorsApp().lightprimarycolor),
//               child: ListView(
//                 // physics: ClampingScrollPhysics(),
//                 // shrinkWrap: true,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 25,
//                       left: 85,
//                     ),
//                     child: Text(
//                       'Welcome To Book App',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                           color: ColorsApp().primarycolor
//                           // color: Color.fromRGBO(55, 42, 83, 1),
//                           ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 35,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 18, right: 18),
//                     child: Container(
//                       height: 55,
//                       child: TextFormField(
//                         cursorColor: ColorsApp().lightprimarycolor,
//                         autocorrect: true,
//                         maxLines: 1,
//
//                         autofocus: true,
//                         //ملاحظة عند التشغيل يعمل  خطا عند الخروج من التطبيق
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: ColorsApp().primarycolor),
//
//                         onFieldSubmitted: (_) => passwordFocus.requestFocus(),
//                         textInputAction: TextInputAction.send,
//                         decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: ColorsApp().lightprimarycolor, width: 1),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           // border: InputBorder.none,
//                           prefixIcon: Icon(
//                             Icons.mail_outlined,
//                             color: Colors.grey,
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           hintText: " Email...",
//                           hintStyle: GoogleFonts.openSans(
//                               color: ColorsApp().lightprimarycolor),
//                           // helperText: 'Hussain'
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 18, right: 18),
//                     child: Container(
//                       height: 55,
//                       child: TextFormField(
//                         focusNode: passwordFocus,
//                         cursorColor: ColorsApp().lightprimarycolor,
//                         maxLines: 1,
//                         enabled: true,
//                         // autofocus: true,
//                         obscureText: passwordVisible,
//                         obscuringCharacter: '*',
//                         keyboardType: TextInputType.visiblePassword,
//                         textInputAction: TextInputAction.send,
//                         controller: passwordController,
//                         maxLengthEnforced: true,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: ColorsApp().primarycolor),
//                         decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: ColorsApp().lightprimarycolor, width: 1),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           // border: InputBorder.none,
//
//                           prefixIcon: IconButton(
//                             icon: Icon(
//                               passwordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.grey,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 passwordVisible = !passwordVisible;
//                               });
//                             },
//                           ),
//
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           hintText: " password...",
//                           hintStyle: GoogleFonts.openSans(
//                               color: ColorsApp().lightprimarycolor),
//                           // helperText: 'Hussain'
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 180),
//                     child: FlatButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ResetPassword()));
//                       },
//                       child: Text(
//                         'Forgot your password ?',
//                         style: TextStyle(
//                             color: ColorsApp().texticon,
//                             fontSize: 15,
//                             fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 10, left: 130, right: 130),
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.06,
//                       child: (clicked == false)
//                           ? RaisedButton(
//                               elevation: 2,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               onPressed: () async {
//                                 setState(() {
//                                   clicked = true;
//                                 });
//
//                                 try {
//                                   await FirebaseAuth.instance
//                                       .signInWithEmailAndPassword(
//                                           email: emailController.text,
//                                           password: passwordController.text);
//                                   await gettoken().then((value) async {
//                                     await FirebaseFirestore.instance
//                                         .collection('users')
//                                         .doc(FirebaseAuth
//                                             .instance.currentUser.uid)
//                                         .update({
//                                       'token': value,
//                                       'location': GeoPoint(
//                                           locationData.latitude,
//                                           locationData.longitude),
//                                     });
//                                   });
//                                   Navigator.of(context).pushReplacement(
//                                     MaterialPageRoute(
//                                         builder: (context) => ItemSelect()),
//                                   );
//                                 } catch (error) {
//                                   switch (error.code) {
//                                     case "invalid-email":
//                                       setState(() {
//                                         errorMessage =
//                                             'please re-check your email';
//                                       });
//                                       break;
//                                     case "wrong-password":
//                                       setState(() {
//                                         errorMessage = 'your password is wrong';
//                                       });
//                                       break;
//                                     case "user-not-found":
//                                       setState(() {
//                                         errorMessage =
//                                             'your email does not exists';
//                                       });
//                                       break;
//                                     case "user-disabled":
//                                       setState(() {
//                                         errorMessage =
//                                             'Your account has been disabled';
//                                       });
//                                       break;
//                                     case "too-many-requests":
//                                       setState(() {
//                                         errorMessage = 'طول بالك حبيبي';
//                                       });
//                                       break;
//                                     case "operation-not-allowed":
//                                       setState(() {
//                                         errorMessage = 'you blocked';
//                                       });
//                                       break;
//                                     default:
//                                       setState(() {
//                                         errorMessage = 'unexpected error';
//                                       });
//                                       break;
//                                   }
//
//                                   if (errorMessage.isNotEmpty) {
//                                     setState(() {
//                                       clicked = false;
//                                     });
//
//                                     BotToast.showSimpleNotification(
//                                         title: 'Attention !!',
//                                         subTitle: errorMessage,
//                                         duration: Duration(seconds: 5));
//                                   }
//                                 }
//                                 if (emailController.text.isEmpty) {
//                                   BotToast.showSimpleNotification(
//                                       title: 'email empty ',
//                                       duration: Duration(seconds: 4));
//                                 } else if (passwordController.text.isEmpty) {
//                                   BotToast.showSimpleNotification(
//                                       title: 'password empty ',
//                                       duration: Duration(seconds: 4));
//                                 } else if (passwordController.text.length < 9) {
//                                   BotToast.showSimpleNotification(
//                                       title:
//                                           "Password should be atleast 9 characters",
//                                       duration: Duration(seconds: 4));
//                                 }
//                               },
//                               color: ColorsApp().darkprimarycolor,
//                               child: Text(
//                                 'SIGN IN',
//                                 style: TextStyle(
//                                   letterSpacing: 1,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           : Center(
//                               child: CircularProgressIndicator(
//                                 valueColor: new AlwaysStoppedAnimation<Color>(
//                                     ColorsApp().primarycolor),
//                               ),
//                             ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1,
//                   ),
//                   divider(),
//                   Padding(
//                     padding: EdgeInsets.only(left: 132, right: 128),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       height: MediaQuery.of(context).size.height * 0.06,
//                       child: RaisedButton(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => CreateAccount()));
//                         },
//                         color: ColorsApp().darkprimarycolor,
//                         child: Text(
//                           'SIGN UP',
//                           style: TextStyle(
//                               letterSpacing: 1,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: ColorsApp().texticon),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget divider() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               child: Divider(
//                 thickness: 1,
//                 color: ColorsApp().darkprimarycolor,
//               ),
//             ),
//           ),
//           Text(
//             'or',
//             style: GoogleFonts.openSans(
//               color: ColorsApp().texticon,
//               fontSize: 16,
//               letterSpacing: 1,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               child: Divider(
//                 thickness: 1,
//                 color: ColorsApp().darkprimarycolor,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }
//
//   gettoken() async {
//     return await firebaseMessaging.getToken();
//   }
//
//   getCustomerLocation() async {
//     Location location = new Location();
//     var result = await location.getLocation();
//     print(result);
//     setState(() {
//       locationData = LatLng(result.latitude, result.longitude);
//     });
//   }
//
//   checkLocationAvailability() async {
//     Location location = new Location();
//
//     _serviceEnabled = await location.serviceEnabled();
//
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//
//       if (_serviceEnabled) {
//         _permissionGranted = await location.hasPermission();
//
//         if (_permissionGranted != PermissionStatus.granted) {
//           _permissionGranted = await location.requestPermission();
//
//           if (_permissionGranted != PermissionStatus.granted) {
//             SystemNavigator.pop();
//           }
//         }
//       } else {
//         SystemNavigator.pop();
//       }
//     } else {
//       _permissionGranted = await location.hasPermission();
//
//       if (_permissionGranted != PermissionStatus.granted) {
//         _permissionGranted = await location.requestPermission();
//
//         if (_permissionGranted != PermissionStatus.granted) {
//           SystemNavigator.pop();
//         }
//       }
//     }
//   }
// }
