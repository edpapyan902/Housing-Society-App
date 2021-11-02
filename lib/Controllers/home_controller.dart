import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:housing_app/models/firebase_constants.dart';
import 'package:housing_app/models/society.dart';

class HomeController extends GetxController {
  Society societyDetails;
  @override
  void onInit() {
    getSocietyInformation();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSocietyInformation() async {
    var soceityInfo = await FirebaseDatabase.instance
        .reference()
        .child(TOWERS)
        .child(TOWER_NAME)
        .once();

    var data = json.encode(soceityInfo.value);

    societyDetails = Society.fromJson(json.decode(data));
    update();
  }
}
