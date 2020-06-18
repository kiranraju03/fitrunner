import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/friendrequestcard.dart';
import '../widgets/searchbar.dart';

class MapsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
                "https://maps.googleapis.com/maps/api/staticmap?center=Bengaluru,Karnataka,IN&zoom=15&size=400x1000&maptype=normal&markers=color:blue%7Clabel:1%7C12.971675, 77.595196&markers=color:green%7Clabel:2%7C12.971759, 77.593538&key=AIzaSyDLnyyGey70aZi8diTB48STItdHt88mTgI"),
            // GoogleMap(
            //   initialCameraPosition: CameraPosition(
            //     target: LatLng(12.92, 77.02),
            //     zoom: 20,
            //   ),
            // ),
          ),
          Positioned(
            top: 50,
            left: 30,
            right: 30,
            child: SearchBar(),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: FriendRequestCard(),
          )
        ],
      ),
    );
  }
}
