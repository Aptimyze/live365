import 'package:LIVE365/Inbox/inbox_page.dart';
import 'package:LIVE365/Upload/CameraAccessScreen.dart';
import 'package:LIVE365/Upload/composents/create_post.dart';
import 'package:LIVE365/camera/add_video_page.dart';
import 'package:LIVE365/components/cam_icon.dart';
import 'package:LIVE365/discover/discover_screen.dart';
import 'package:LIVE365/firebaseService/FirebaseService.dart';
import 'package:LIVE365/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

import '../SizeConfig.dart';
import '../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    FirebaseService.changeStatus("Online");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WillPopScope(
        onWillPop: () async => false,
        child: getBody(),
      ),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        Body(),
        DiscoverScreen(),
        CameraAccessScreen(),
        Inbox(),
        ProfileScreen(),
      ],
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {"icon": "assets/icons/Phone.svg", "label": "Home", "isIcon": true},
      {
        "icon": "assets/icons/Search Icon.svg",
        "label": "Search",
        "isIcon": true
      },
      {"icon": "", "label": "", "isIcon": false},
      {
        "icon": "assets/icons/Chat bubble Icon.svg",
        "label": "Inbox",
        "isIcon": true
      },
      {"icon": "assets/icons/User Icon.svg", "label": "Me", "isIcon": true}
    ];
    return Container(
      height: getProportionateScreenHeight(80),
      width: double.infinity,
      decoration: BoxDecoration(color: GBottomNav),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      selectedTab(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: SvgPicture.asset(
                            bottomItems[index]['icon'],
                            color: white,
                          ),
                          onPressed: () {},
                        ),
                        Center(
                          child: Text(
                            bottomItems[index]['label'],
                            style: TextStyle(
                                color: white,
                                fontFamily: "SFProDisplay-Regular",
                                fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      chooseUpload(context);
                    },
                    child: CamIcon());
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

  chooseUpload(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: GBottomNav,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Center(
                  child: Text(
                    'SELECT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.video_camera,
                  color: Colors.white,
                  size: 25.0,
                ),
                title: Text('Go Live',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                onTap: () async {
                  ///Feature coming soon
                  ///
                  await _handleCameraAndMic();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddVideoPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.camera_on_rectangle,
                  color: Colors.white,
                  size: 25.0,
                ),
                title: Text('Make a Post',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => CreatePost()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() async {
    FirebaseService.changeStatus("Away");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    FirebaseService.changeStatus("Away");
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
