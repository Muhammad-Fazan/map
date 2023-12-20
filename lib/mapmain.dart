import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import 'mymap.dart';
class mapmain extends StatefulWidget {
  const mapmain({super.key});

  @override
  State<mapmain> createState() => _mapmainState();
}

class _mapmainState extends State<mapmain> {
  @override
  final Location location = Location as Location;
  StreamSubscription<LocationData>? locationsubscription;

  void inistate(){
    super.initState();
    _requestPermission();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("live location"),
      ),
      body:Column(
        children: [
          TextButton(onPressed: (){
            getlocation();
          }, child: Text("add my location")),
          TextButton(onPressed: (){
            // listenlocation();
          }, child: Text("anable my location")),
          TextButton(onPressed: (){
            // stoplocation();
          }, child: Text("stop live location")),
          StreamBuilder(stream: FirebaseFirestore.instance.collection("location").snapshots(),
              builder:(context, AsyncSnapshot<QuerySnapshot> snapshort){
            if(!snapshort.hasData){
              return Center(
                child: CircularProgressIndicator()
              );
            }
            return ListView.builder(
              itemCount: snapshort.data?.docs.length,
                itemBuilder: (context, index){
                return ListTile(
                  title:Text(snapshort.data!.docs[index]['name'].toString()),
                  subtitle: Row(
                    children: [
                      Text(snapshort.data!.docs[index]['latitude'].toString()),
                      SizedBox(width: 20,),
                      Text(snapshort.data!.docs[index]['longitude'].toString()),

                    ],
                  ),
                  trailing: IconButton(icon: Icon(Icons.directions),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => mymap(snapshort.data!.docs[index].id)));
                  },),
                );
                });
            }
          ),
        ],
      )
    );
  }
  getlocation() async {
    try{
      final LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': "fazan",
      }, SetOptions(merge: true));
    } catch (e){
      print(e);
    }
  }
  _requestPermission() async {
    var status = await Permission.location.request();
    if(status.isGranted){
      print('Done');
    }else if(status.isDenied){
      _requestPermission();
    }else if(status.isPermanentlyDenied){
      openAppSettings();
    }
  }
}

