// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   late LatLng user1Location;
//   late LatLng user2Location;
//
//   Set<Marker> markers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   _getCurrentLocation() async {
//     // Get the current location of User 1
//     Position position1 = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     // Get the current location of User 2
//     Position position2 = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     setState(() {
//       user1Location = LatLng(position1.latitude, position1.longitude);
//       user2Location = LatLng(position2.latitude, position2.longitude);
//
//       // Update markers for both users
//       markers = {
//         Marker(
//           markerId: MarkerId('User1'),
//           position: user1Location,
//           infoWindow: InfoWindow(title: 'User 1'),
//         ),
//         Marker(
//           markerId: MarkerId('User2'),
//           position: user2Location,
//           infoWindow: InfoWindow(title: 'User 2'),
//         ),
//       };
//
//       print("User 1 Location: $user1Location");
//       print("User 2 Location: $user2Location");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//       ),
//       body: GoogleMap(
//         onMapCreated: (controller) {
//           setState(() {
//             mapController = controller;
//           });
//         },
//         initialCameraPosition: CameraPosition(
//           target: LatLng(0.0, 0.0), // Initial map center
//           zoom: 10.0, // Initial zoom level
//         ),
//         markers: markers,
//       ),
//     );
//   }
// }