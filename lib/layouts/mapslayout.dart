import 'package:flutter/material.dart';

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
            child: Center(
              child: Text("GOOGLE MAPS"),
            ),
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
