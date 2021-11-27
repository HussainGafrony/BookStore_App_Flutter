// import 'package:bookStor/src/screen/bottomitem/itemselect.dart';
// import 'package:bookStor/widget/color_app.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class CreateAccount extends StatefulWidget {
//   @override
//   _CreateAccountState createState() => _CreateAccountState();
// }
//
// class _CreateAccountState extends State<CreateAccount> {
//   TextEditingController firstnameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   FocusNode emailFocus = FocusNode();
//   FocusNode passwordFocus = FocusNode();
//   bool passwordVisible = true;
//   String errorMessage;
//   bool clicked = false;
//   var _serviceEnabled;
//   var _permissionGranted;
//   LatLng locationData;
//
//   @override
//   void initState() {
//     emailFocus = FocusNode();
//     passwordFocus = FocusNode();
//     checkLocationAvailability().then((_) async {
//       await getCustomerLocation();
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     emailFocus.dispose();
//     passwordFocus.dispose();
//     firstnameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color.fromRGBO(244, 180, 93, 1),
//       backgroundColor: ColorsApp().texticon,
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 15,
//               bottom: 25,
//             ),
//             child: Image.asset(
//               'assets/images/book.jpg',
//               height: MediaQuery.of(context).size.height * 0.42,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: Padding(
//               padding: EdgeInsets.only(top: 4),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 50,
//                     child: TextFormField(
//                       autocorrect: true,
//                       maxLines: 1,
//                       enabled: true,
//                       autofocus: true,
//                       cursorColor: ColorsApp().lightprimarycolor,
//                       controller: firstnameController,
//                       keyboardType: TextInputType.name,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: ColorsApp().darkprimarycolor),
//
//
//                       onFieldSubmitted: (_) => emailFocus.requestFocus(),
//                       textInputAction: TextInputAction.send,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: ColorsApp().texticon,
//
//                         // border: InputBorder.none,
//                         prefixIcon: Icon(
//                           Icons.person_outline,
//                           color: Colors.grey,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: ColorsApp().lightprimarycolor, width: 1),
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         hintText: "  Name ...",
//                         // focusColor: ColorsApp().darkprimarycolor,
//                         hintStyle: GoogleFonts.openSans(
//                             color: ColorsApp().lightprimarycolor),
//                         // helperText: 'Hussain'
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Container(
//                     height: 50,
//                     child: TextFormField(
//                       cursorColor: ColorsApp().lightprimarycolor,
//                       autocorrect: true,
//                       maxLines: 1,
//                       enabled: true,
//                       autofocus: true,
//                       controller: emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       focusNode: emailFocus,
//
//                       onFieldSubmitted: (_) => passwordFocus.requestFocus(),
//                       textInputAction: TextInputAction.send,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: ColorsApp().darkprimarycolor),
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: ColorsApp().lightprimarycolor, width: 1),
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         filled: true,
//                         fillColor: ColorsApp().texticon,
//                         // border: InputBorder.none,
//                         prefixIcon: Icon(
//                           Icons.mail_outlined,
//                           color: Colors.grey,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         hintText: " Email...",
//                         hintStyle: GoogleFonts.openSans(
//                             color: ColorsApp().lightprimarycolor),
//                         // helperText: 'Hussain'
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Container(
//                     height: 50,
//                     child: TextFormField(
//                       cursorColor: ColorsApp().lightprimarycolor,
//                       autocorrect: true,
//                       maxLines: 1,
//                       enabled: true,
//                       autofocus: true,
//                       obscureText: passwordVisible,
//                       obscuringCharacter: '*',
//                       keyboardType: TextInputType.visiblePassword,
//                       controller: passwordController,
//                       textInputAction: TextInputAction.send,
//                       inputFormatters: [LengthLimitingTextInputFormatter(9)],
//                       maxLengthEnforced: true,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: ColorsApp().darkprimarycolor),
//                       focusNode: passwordFocus,
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: ColorsApp().lightprimarycolor, width: 1),
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         // border: InputBorder.none,
//
//                         prefixIcon: IconButton(
//                           icon: Icon(
//                             passwordVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Colors.grey,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               passwordVisible = !passwordVisible;
//                             });
//                           },
//                         ),
//                         filled: true,
//                         fillColor: ColorsApp().texticon,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         hintText: " password...",
//                         hintStyle: GoogleFonts.openSans(
//                             color: ColorsApp().lightprimarycolor),
//                         // helperText: 'Hussain'
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   (clicked == false)
//                       ? Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: ColorsApp().darkprimarycolor,
//                           ),
//                           width: 125,
//                           height: 42,
//                           child: FlatButton(
//                             child: Text(
//                               'SIGN UP',
//                               style: TextStyle(
//                                 letterSpacing: 1,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: () async {
//                               setState(() {
//                                 clicked = true;
//                               });
//
//                               try {
//                                 await _auth.createUserWithEmailAndPassword(
//                                     email: emailController.text,
//                                     password: passwordController.text);
//                                 await gettoken().then((value) async {
//                                   await FirebaseFirestore.instance
//                                       .collection('users')
//                                       .doc(
//                                           FirebaseAuth.instance.currentUser.uid)
//                                       .set({
//                                     'name': firstnameController.text.trim(),
//                                     'email': emailController.text.trim(),
//                                     'password': passwordController.text.trim(),
//                                     'location': GeoPoint(locationData.latitude,
//                                         locationData.longitude),
//                                     'token': value,
//                                   });
//                                 });
//
//                                 Navigator.of(context).pushReplacement(
//                                     MaterialPageRoute(
//                                         builder: (context) => ItemSelect()));
//                                 BotToast.showSimpleNotification(
//                                   title: 'Account Created',
//                                   duration: Duration(seconds: 4),
//                                 );
//                               } catch (error) {
//                                 switch (error.code) {
//                                   case "email-already-in-use":
//                                     setState(() {
//                                       errorMessage = 'email-already-in-use';
//                                     });
//                                     break;
//                                   case "invalid-email":
//                                     setState(() {
//                                       errorMessage = 'invalid-email';
//                                     });
//                                     break;
//                                   case "operation-not-allowed":
//                                     setState(() {
//                                       errorMessage =
//                                           'This service is not activated';
//                                     });
//                                     break;
//                                   case "weak-password":
//                                     setState(() {
//                                       errorMessage = 'weak-password';
//                                     });
//                                     break;
//
//                                   default:
//                                     setState(() {
//                                       errorMessage = 'unexpected error';
//                                     });
//                                     break;
//                                 }
//                                 if (errorMessage.isNotEmpty) {
//                                   setState(() {
//                                     clicked = false;
//                                   });
//
//                                   BotToast.showSimpleNotification(
//                                       title: 'Attention !!',
//                                       subTitle: errorMessage,
//                                       duration: Duration(seconds: 5));
//                                 }
//                               }
//
//                               if (firstnameController.text.isEmpty) {
//                                 BotToast.showSimpleNotification(
//                                     title: 'Name empty ',
//                                     duration: Duration(seconds: 4));
//                               } else if (emailController.text.isEmpty) {
//                                 BotToast.showSimpleNotification(
//                                     title: 'email empty ',
//                                     duration: Duration(seconds: 4));
//                               } else if (passwordController.text.isEmpty) {
//                                 BotToast.showSimpleNotification(
//                                     title: 'password empty ',
//                                     duration: Duration(seconds: 4));
//                               } else if (passwordController.text.length < 9) {
//                                 BotToast.showSimpleNotification(
//                                     title:
//                                         "Password should be atleast 9 characters",
//                                     duration: Duration(seconds: 4));
//                               }
//                             },
//                           ),
//                         )
//                       : Center(
//                           child: CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                                 ColorsApp().primarycolor),
//                           ),
//                         ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
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
//   gettoken() async {
//     return await firebaseMessaging.getToken();
//   }
// }
