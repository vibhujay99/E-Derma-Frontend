// import 'package:flutter/services.dart';
// import 'package:location/location.dart';
//
// class LocationService{
//
//   late Location location;
//   bool _serviceEnabled = false;
//   PermissionStatus? permissionGranted;
//
//   LocationService(){
//     location = Location();
//   }
//
//   Future<bool> checkPermission() async{
//     if(await checkService()){
//       permissionGranted = await location.hasPermission();
//       if(permissionGranted == PermissionStatus.denied){
//         permissionGranted = await location.requestPermission();
//       }
//     }
//     return permissionGranted == PermissionStatus.granted;
//   }
//
//   Future<bool>checkService() async{
//     try{
//       _serviceEnabled = await location.serviceEnabled();
//       if(!_serviceEnabled){
//         _serviceEnabled = await location.requestService();
//       }
//     }
//     on PlatformException catch(e){
//       _serviceEnabled = false;
//       await checkService();
//     }
//     return _serviceEnabled;
//   }
//
//   Future<LocationData?> getLocation() async{
//     if(await checkPermission()){
//       final locationData = location.getLocation();
//       return locationData;
//     }
//     // return null;
//   }
//
//
// }