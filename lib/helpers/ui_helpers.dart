import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:housing_app/helpers/app_constants.dart';
import 'package:housing_app/helpers/text_styles.dart';

Future<bool> checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('Internet Connected');
    }
  } on SocketException catch (_) {
    print('Internet Not connected');
    return false;
  }
  return true;
}

Future<bool> comfirmExitFromUser(BuildContext context) {
  return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            'Are you sure?',
          ),
          content: Text('Do you want to exit an app'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                exit(0);
              },
              child: new Text('Yes'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
          ],
        ),
      ) ??
      false;
}

showSnackBar(String msG) {
  return Get.snackbar(
    msG,
    "",
    backgroundColor: AppConstants.textThemeColor,
    titleText: Text(
      msG,
      style: TextStyles.regboldTxtStyle.copyWith(color: Colors.white),
    ),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM,
  );
}

void showLoadingWidget() {
  Get.dialog(
    WillPopScope(
      onWillPop: () {
        return;
      },
      child: SpinKitFoldingCube(
        color: Colors.white,
        size: 50.0,
        duration: Duration(milliseconds: 1000),
      ),
    ),
  );
}

String getImageUrlForImage(String facility) {
  switch (facility) {
    case "Gym Facility":
      return "Assets/Facilities/gym.png";
      break;
    case "Swimming Pool":
      return "Assets/Facilities/swimmer.png";
      break;
    case "WiFI":
      return "Assets/Facilities/free-wifi.png";
      break;
    case "Guest Parking":
      return "Assets/Facilities/parking.png";
      break;
    case "Security Camera":
      return "Assets/Facilities/cctv.png";
      break;
  }
  return "";
}
