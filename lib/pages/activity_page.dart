import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/constant/activity_json.dart';
import 'package:untitled/constant/post_json.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'New',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            Column(
              children: List.generate(posts.length, (index) {
                return ActivityItems(
                  name: posts[index]["name"],
                  img: posts[index]["postImg"],
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'This Week',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            Column(
              children: List.generate(ThisWeeek.length, (index) {
                return ActivityItems(
                  name: ThisWeeek[index]["name"],
                  img: ThisWeeek[index]["profileImg"],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityItems extends StatelessWidget {
  final String name, img;
  const ActivityItems({
    Key key,
    this.name,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xffbd1664),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(img),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$name",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        " followed by me",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Folllow",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  onSurface: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 7),
        Divider(
          color: Colors.white.withOpacity(0.3),
        ),
      ],
    );
  }
}
