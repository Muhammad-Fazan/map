import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class mymap extends StatefulWidget {
  final String user_Id;
  mymap(this.user_Id);
  @override
  State<mymap> createState() => _mymapState();
}

class _mymapState extends State<mymap> {
  @override
  final Location location = Location as Location;
  late GoogleMapController _controller;
  bool _added =false;
  late final String user_Id;

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("location").snapshots(),
          builder:(context, AsyncSnapshot<QuerySnapshot> snapshort){
        if(_added){
          mymapp(snapshort);
        }
            if(!snapshort.hasData){
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            return GoogleMap(
              mapType: MapType.normal,
                markers: {Marker
                  (position: LatLng(
            snapshort.data!.docs.singleWhere(
            (element) => element.id == widget.user_Id)['latitude'],
            snapshort.data!.docs.singleWhere(
            (element) => element.id == widget.user_Id)['longitude'],

            ),
                    markerId: MarkerId('Id'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
                )},
                initialCameraPosition: CameraPosition(
                target: LatLng(
                  snapshort.data!.docs.singleWhere(
                        (element) => element.id == widget.user_Id)['latitude'],
                  snapshort.data!.docs.singleWhere(
                      (element) => element.id == widget.user_Id)['longitude'],

            ),
                    zoom: 14.47),
                    onMapCreated: (GoogleMapController controller) async {
                  setState(() {
                    _controller = controller;
                    _added = true;
                  });
                  }
            );
          }
      ),
    );
  }
  Future<void> mymapp(AsyncSnapshot<QuerySnapshot> snapshort) async{
    await _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(
      snapshort.data!.docs.singleWhere(
              (element) => element.id == widget.user_Id)['latitude'],
      snapshort.data!.docs.singleWhere(
              (element) => element.id == widget.user_Id)['longitude'],

    ),zoom: 14.47,
    )));
  }
}
