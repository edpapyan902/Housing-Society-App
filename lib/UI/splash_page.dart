import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_app/UI/home_page.dart';
import 'package:housing_app/UI/login_page.dart';
import 'package:housing_app/helpers/responsive_helper.dart';
import 'package:housing_app/helpers/session_data.dart';
import 'package:housing_app/models/firebase_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  FirebaseUser user;
  FirebaseAuth _auth = FirebaseAuth.instance;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 800));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });

    checkForLoggedUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponseHelper(
      width: Get.width,
      height: Get.height,
      fontSize: Get.height > 700 ? 16 : 15,
      titleFontSize: Get.height > 700 ? 28 : 22,
      appBarTitleSize: Get.height > 700 ? 52 : 36,
      headingFontSize: Get.height > 700 ? 84 : 74,
      appThemeColor: Colors.indigo,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text("Soceity Management App"),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'Assets/app_icon.png',
                width: animation.value * 200,
                height: animation.value * 200,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void checkForLoggedUser() async {
    user = await _auth.currentUser();
    if (user != null) {
      getDetailsFromFirebaseDB(user.uid);
      Timer(Duration(seconds: 3), () => Get.off(HomePage()));
    } else {
      Timer(Duration(seconds: 3), () => Get.off(LoginPage()));
    }
  }

  Future getDetailsFromFirebaseDB(String uid) async {
    var userData = await FirebaseDatabase.instance
        .reference()
        .child(USERS)
        .child(uid)
        .once();

    // Save Value into SingleTon fron FirebaseDB
    SessionData();
    SessionData.instance.name = userData.value[NAME];
    SessionData.instance.flatNo = int.parse(userData.value[FLAT_NO]);
    SessionData.instance.maintainenceStatus = userData.value[DUE_PRESENT];
    SessionData.instance.vehicleCount =
        int.parse(userData.value[VEHICLES_COUNT]);
    SessionData.instance.idCards = userData.value[ID_CARDS] != null
        ? userData.value[ID_CARDS].cast<String>()
        : [];
  }
}
