import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Set<Marker> _marker = {};

  void _mapcreate(GoogleMapController controller) {
    setState(() {
      _marker.add(
        const Marker(
          markerId: MarkerId('Marker-1'),
          position: LatLng(32.4925139, 74.5487448),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          buildingsEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: _mapcreate,
          compassEnabled: true,
          markers: _marker,
          initialCameraPosition: const CameraPosition(
            target: LatLng(32.4945, 74.5229),
            zoom: 12,
          ),
        ),
      ),
    );
  }
}
