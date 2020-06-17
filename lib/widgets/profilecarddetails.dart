import 'package:flutter/material.dart';

class ProfileCardDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.25, 0.5],
            colors: [Colors.purple, Colors.red[600]],
            tileMode: TileMode.repeated,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
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
                  Stack(children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.purpleAccent,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage('assets/images.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 32,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "13 lvl",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile Name",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.white,
                            ),
                            Text(
                              "Place Name",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
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
                numberAccomplished("800", "distance, mi"),
                numberAccomplished("105K", "total steps"),
                numberAccomplished("3.8K", "total calories, kcal"),
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
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        Text(
          accomplishmentType,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
