import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchValueController = new TextEditingController();
  // String searchValue = '';
  List<String> searchTextList = [];
  List<Widget> searchTextsWidgets = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 10,
            child: TextField(
              controller: searchValueController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                hintStyle: TextStyle(fontSize: 13),
                hintText: 'Search for sport buddies in real time',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {
                    this.setState(() {
                      searchTextList.add(searchValueController.text);
                      // searchTextsWidgets
                      //     .add(searchValueHolder(searchValueController.text));
                    });
                    searchValueController.clear();
                    print(searchTextsWidgets.toString());
                  },
                ),
              ),
            ),
          ),
        ),
        Row(
          // children: searchTextsWidgets,
          children: searchTextList.map((element) {
            return searchValueHolder(element);
          }).toList(),
        )
      ],
    );
  }

  Widget searchValueHolder(String searchedString) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                searchedString,
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  this.setState(() {
                    searchTextList.remove(searchedString);
                  });
                },
                child: Icon(
                  Icons.close,
                  size: 15,
                  color: Colors.white,
                ),
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.close,
              //     size: 15,
              //     color: Colors.white,
              //   ),
              //   onPressed: () {},
              // )
            ],
          ),
        ),
      ),
    );
  }
}
