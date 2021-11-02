import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:housing_app/UI/home_page.dart';
import 'package:housing_app/helpers/ui_helpers.dart';
import 'package:housing_app/helpers/session_data.dart';
import 'package:housing_app/models/firebase_constants.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void loginButtonPressed(String email, String password) async {
    if (await checkInternet()) {
      showLoadingWidget();
      try {
        final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ))
            .user;

        if (user != null) {
          getDetailsFromDB(user).then((value) {
            SessionData(
              name: value["name"],
              flatNo: value["Flat"],
              idCards: value[ID_CARDS].cast<String>(),
              maintainenceStatus: value["maintenance"],
              vehicleCount: value["Vehicles"],
            );
            print(SessionData.instance.name);
            Navigator.pop(Get.context);
            Get.off(HomePage());
          });
        } else {
          Navigator.pop(Get.context); //pop Loading dialog
          showSnackBar("Login Failed , Please try again");
        }
      } catch (error) {
        Navigator.pop(Get.context); //pop Loading dialog
        var errorMessage = "";
        switch (error.code) {
          case "ERROR_INVALID_EMAIL":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "ERROR_WRONG_PASSWORD":
            errorMessage = "Entered password is wrong.";
            break;
          case "ERROR_USER_NOT_FOUND":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "ERROR_USER_DISABLED":
            errorMessage = "User with this email has been disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            errorMessage = "Too many requests. Try again later.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        showSnackBar(errorMessage);
      }
    } else {
      showSnackBar(
          "No Internet Connection !\nPlease Connect to Internet to Login");
    }
  }

  Future getDetailsFromDB(FirebaseUser user) async {
    var userData = await FirebaseDatabase.instance
        .reference()
        .child(USERS)
        .child(0.toString())
        .once();

    print("Logged User Data " + userData.value.toString());
    return userData.value;
  }
}
