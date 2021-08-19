import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constant/search_json.dart';
import 'package:untitled/theme/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 15),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.5),
                      )),
                  style: TextStyle(
                    color: white.withOpacity(0.3),
                  ),
                  cursorColor: white.withOpacity(0.3),
                ),
                height: 45,
                width: size.width - 30,
                decoration: BoxDecoration(
                  color: textFieldBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: List.generate(searchCategories.length, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: white.withOpacity(0.3)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 25, top: 15, bottom: 12),
                      child: Text(
                        searchCategories[index],
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 15),
          Wrap(
            children: List.generate(searchImages.length, (index) {
              return Container(
                width: (size.width - 3) / 3,
                height: (size.width - 3) / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(searchImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
