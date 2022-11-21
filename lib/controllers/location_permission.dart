import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart';

import 'globalState.dart';


 getCurrentLocation() async {
  await _determinePosition();
}

Future _determinePosition() async {
  
  // permission = await Geolocator.checkPermission();
  var permission = await Permission.location.status;
  if (permission.isGranted) {
    // await location.Location();
    var position = await location.Location().getLocation();
    var place;
     if (position != null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude!.toDouble(), position.longitude!.toDouble());
      place = placemarks[0];
      print(place);
    GlobalState.location = "$place";
    
    }

  // GlobalState.userDetails!.long = "${position.longitude}";
  } 
  else {
    await Permission.location.request();
  }
  
}
