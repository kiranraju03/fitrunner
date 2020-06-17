import 'package:flutter/material.dart';

class ProfileCardDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
        // height: (MediaQuery.of(context).size.height) / 4.0,
        child: Column(
          children: [
            //Top navigation and settings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_left),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                )
              ],
            ),
            //Profile name section
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 48,
                    // backgroundImage: AssetImage(''),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile Name",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15,
                            ),
                            Text(
                              "Place Name",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //goals achieved numbers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberAccomplished("800", "distance"),
                numberAccomplished("105K", "total steps"),
                numberAccomplished("3.8K", "total calories"),
              ],
            )
          ],
        ));
  }

  //Used to get the accomplished column elements
  Widget numberAccomplished(String number, String accomplishmentType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 25),
        ),
        Text(
          accomplishmentType,
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
