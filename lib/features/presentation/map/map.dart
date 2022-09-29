import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_work/features/presentation/widgets/search_bar.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  _MyMapState createState() => _MyMapState();
}
class _MyMapState extends State<MyMap> {
  late Position _myPosition;

  getCurrentPosition() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    _myPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    log('$_myPosition');
    return _myPosition;
  }

 @override
  void initState() {
   super.initState();
   getCurrentPosition();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(42.87462, 74.56976),
              zoom: 10
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              FutureBuilder(
                  future: getCurrentPosition(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return  MarkerLayer(
                        markers: [
                          Marker(
                              point: LatLng(_myPosition.latitude, _myPosition.longitude),
                              builder: (context) => const ImageIcon(AssetImage('assets/images/mePlace.png'), color: Colors.red,)
                          )
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 54, 16, 0),
            child: SearchBar()
          )
        ],
      ),
    );
  }
}