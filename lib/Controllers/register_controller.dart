import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:housing_app/UI/home_page.dart';
import 'package:housing_app/helpers/session_data.dart';
import 'package:housing_app/helpers/ui_helpers.dart';
import 'package:housing_app/models/firebase_constants.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController flatNoController = TextEditingController();
  TextEditingController vehiclesController = TextEditingController();

  void registerButtonPressed() async {
    if (await checkInternet()) {
      showLoadingWidget();
      try {
        final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        ))
            .user;

        if (user != null) {
          await addUsertoDB(user).then((value) {
            Navigator.pop(Get.context);
            Get.off(HomePage());
          });
          print(user);
        } else {
          Navigator.pop(Get.context); //pop Loading dialog
          showSnackBar("Login Failed , Please try again");
        }
      } catch (error) {
        Navigator.pop(Get.context); //pop Loading dialog
        print(error);
        showSnackBar(error.message);
      }
    } else {
      showSnackBar(
          "No Internet Connection !\nPlease Connect to Internet to Login");
    }
  }

  Future addUsertoDB(FirebaseUser user) async {
    var update = {
      NAME: emailController.text,
      FLAT_NO: flatNoController.text,
      DUE_PRESENT: false,
      ID_CARDS: ["Gym Id", "Gate Pass", "24/7 Club"],
      VEHICLES_COUNT: vehiclesController.text,
    };

    SessionData();
    SessionData.instance.name = emailController.text;
    SessionData.instance.flatNo = int.parse(flatNoController.text);
    SessionData.instance.maintainenceStatus = false;
    SessionData.instance.vehicleCount = int.parse(vehiclesController.text);
    SessionData.instance.idCards = ["Gym Id", "Gate Pass", "24/7 Club"];

    await FirebaseDatabase.instance
        .reference()
        .child(USERS)
        .child(user.uid)
        .update(update);
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    flatNoController.dispose();
    super.onClose();
  }
}
