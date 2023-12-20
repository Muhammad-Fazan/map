// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class userlocation extends StatefulWidget {
//   const userlocation({super.key});
//
//   @override
//   State<userlocation> createState() => _userlocationState();
// }
//
// class _userlocationState extends State<userlocation> {
//
//   final Completer<GoogleMapController> _controller = Completer();
//
//   static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(33.6844, 73.0479),
//     zoom: 14,
//   );
//
//   final List<Marker> _markers = <Marker>[
//     Marker(markerId: MarkerId('1'),
//       position: LatLng(33.6844, 73.0479),
//       infoWindow: InfoWindow(
//         title: 'The title of the window'
//       )
//     )
//   ];
//
//   loadData(){
//     getUserCurrentLocation().then((value) async {
//       print('my current location');
//       print(value.latitude.toString()+''+value.longitude.toString());
//
//       _markers.add(Marker(markerId: MarkerId('2'),
//           position: LatLng(value.latitude,value.longitude),
//           infoWindow: InfoWindow(
//               title: 'My current '
//           )
//       )
//       );
//       CameraPosition cameraPosition = CameraPosition(
//           zoom: 14,
//           target: LatLng(value.latitude,value.longitude));
//       final GoogleMapController controller = await _controller.future;
//       controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//       setState(() {
//
//       });
//
//     });
//
//
//   }
//
//   Future<Position> getUserCurrentLocation() async{
//
//     await Geolocator.requestPermission().then((value) {
//
//     }).onError((error, stackTrace) {
//       print('error'+error.toString());
//     });
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   void initState(){
//     super.initState();
//     loadData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:GoogleMap(
//         initialCameraPosition: _kGooglePlex,
//         markers: Set<Marker>.of(_markers),
//         onMapCreated: (GoogleMapController controller){
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//
//
//         },
//         child: Icon(Icons.location_on_outlined),
//       ),
//     );
//   }
// }
