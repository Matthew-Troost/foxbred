import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Map extends StatefulWidget {
  @override
  _MapState createState() => new _MapState();
}

class _MapState extends State<Map> {
  Geolocator geolocator = Geolocator();
  StreamSubscription<Position> positionSubscription;
  Position userLocation;

  void checkPermission() {
    geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
    });
    geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }

  @override
  void initState() {
    super.initState();

    initPlatformState();

    //checkPermission();

    positionSubscription = geolocator
        .getPositionStream(LocationOptions(
            accuracy: LocationAccuracy.best, timeInterval: 1000))
        .listen((Position position) {
      setState(() {
        userLocation = position;
      });
    });
  }

  void initPlatformState() async {
    Position position;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } on PlatformException {
      position = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      userLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
        options:
            new MapOptions(center: new LatLng(userLocation.latitude, userLocation.longitude), minZoom: 10.0),
        layers: [
          new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/matthew-troost/cjvmimzbg0ppz1cmv20vm0e95/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWF0dGhldy10cm9vc3QiLCJhIjoiY2ppcmdxY3FtMGZ1eDNwcW15ejJ1d2R4MiJ9.m-8aI-Zj0FsFC86Jit8cEA",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoibWF0dGhldy10cm9vc3QiLCJhIjoiY2ppcmdxY3FtMGZ1eDNwcW15ejJ1d2R4MiJ9.m-8aI-Zj0FsFC86Jit8cEA',
                'id': 'mapbox.mapbox-streets-v8'
              }),
          new MarkerLayerOptions(markers: [
            new Marker(
                width: 45.0,
                height: 45.0,
                point:
                    new LatLng(userLocation.latitude, userLocation.longitude),
                builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.person_pin_circle),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
          ])
        ]);
  }

  @override
  void dispose() {
    if (positionSubscription != null) {
      positionSubscription.cancel();
      positionSubscription = null;
    }
    super.dispose();
  }
}
