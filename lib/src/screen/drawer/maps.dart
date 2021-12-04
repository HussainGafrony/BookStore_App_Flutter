import 'dart:async';

import 'package:bookStor/widget/color_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> mapController = Completer();
  List<Marker> dataMarker = [];
  LatLng userLocationData;

  @override
  void initState() {
    super.initState();

    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp().primarycolor,
        title: Text('Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: userLocationData,
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController.complete(controller);
            },
            markers: dataMarker.toSet(),
          ),
        ],
      ),
    );
  }
    // Location User
  getUserLocation() async {
    Location location = new Location();
    var userLocation = await location.getLocation();
    setState(() {
      userLocationData = LatLng(userLocation.latitude, userLocation.longitude);
    });
  }


// Markers realtime

// getUserAndLocation() async {
//   await FirebaseFirestore.instance.collection('users').get().then((value) {
//     value.docChanges.forEach((element) {
//       setState(() {
//         dataMarker.add(
//           Marker(
//             markerId: MarkerId(element.doc.id),
//             infoWindow: InfoWindow(
//               title: element.doc.data()['name'].toString(),
//             ),
//             position: LatLng(element.doc.data()['location'].latitude,
//                 element.doc.data()['location'].longitude),
//           ),
//         );
//       });
//     });
//   });
// }


}
