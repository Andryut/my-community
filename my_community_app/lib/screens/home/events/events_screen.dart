import 'package:flutter/material.dart';
import 'user_information.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'events_nearby_list.dart';
import 'package:location/location.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  Location location = new Location();
  LocationData userLocation;
  int _markerIdCounter = 0;

  var locationTitle = Text(
    'Your location says you are in',
    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
  );

  GoogleMapController mapController;
  Marker marker;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    location.onLocationChanged().listen((location) async {
      if (marker != null) {
        markers.remove(marker);
      }
      _markerIdCounter += 1;
      final MarkerId markerId = MarkerId('marker_id_$_markerIdCounter');
      marker = Marker(
        markerId: markerId,
        position: LatLng(location.latitude, location.longitude),
      );
      setState(() {
        markers[markerId] = marker;
      });
      mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              location.latitude,
              location.longitude,
            ),
            zoom: 14.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: locationTitle),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: userLocation == null
                  ? CircularProgressIndicator()
                  : Text("Location:" +
                      userLocation.latitude.toString() +
                      " " +
                      userLocation.longitude.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                color: Colors.blue,
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(60, 20, 60, 0),
              height: 200,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.4219999, -122.0862462),
                ),
                myLocationEnabled: true,
                markers: Set<Marker>.of(markers.values),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Center(
                child: Text(
                  'Chats in this location:',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                ),
              ),
            ),
            Flexible(child: eventsNearbyList),
          ],
        ),
      ),
    );
  }

  Future<LocationData> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
