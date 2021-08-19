import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/pages/Account_Page.dart';
import 'package:untitled/pages/activity_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/search_page.dart';
import 'package:untitled/pages/upload_page.dart';
import 'package:untitled/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/images/camera_icon.svg",
              width: 30,
            ),
            Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 35.0,
              ),
            ),
            SvgPicture.asset(
              'assets/images/message_icon.svg',
              width: 30,
            ),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text('Upload'),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text('Activity'),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.lock_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'hazratsharif',
                    style: TextStyle(
                        letterSpacing: 0.01,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.add_box_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.menu_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? 'assets/images/home_active_icon.svg'
          : 'assets/images/home_icon.svg',
      pageIndex == 1
          ? 'assets/images/search_active_icon.svg'
          : 'assets/images/search_icon.svg',
      pageIndex == 2
          ? 'assets/images/upload_active_icon.svg'
          : 'assets/images/upload_icon.svg',
      pageIndex == 3
          ? 'assets/images/love_active_icon.svg'
          : 'assets/images/love_icon.svg',
      pageIndex == 4
          ? 'assets/images/account_active_icon.svg'
          : 'assets/images/account_icon.svg',
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: appFooterColor),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
              onTap: () {
                selectedTap(index);
              },
              child: SvgPicture.asset(
                bottomItems[index],
                width: 27,
              ),
            );
          }),
        ),
      ),
    );
  }

  selectedTap(index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      SearchPage(),
      UploadPicture(),
      ActivityPage(),
      AccountPage(),
      Center(
        child: Text(
          "Search Page",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Center(
        child: Text(
          "Upload Page",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Center(
        child: Text(
          "Activity Page",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }
}
