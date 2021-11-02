import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_app/Controllers/home_controller.dart';
import 'package:housing_app/UI/login_page.dart';
import 'package:housing_app/UI/widgets/id_card.dart';
import 'package:housing_app/helpers/app_constants.dart';
import 'package:housing_app/helpers/responsive_helper.dart';
import 'package:housing_app/helpers/session_data.dart';
import 'package:housing_app/helpers/text_styles.dart';
import 'package:housing_app/helpers/ui_helpers.dart';
import 'package:housing_app/UI/notices_pages.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.appThemeColor,
        body: GetBuilder<HomeController>(builder: (homeController) {
          return homeController.societyDetails != null
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 22, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeController.societyDetails.name,
                              style: TextStyles.extralargeTxtStyleBold
                                  .copyWith(color: Colors.black87),
                            ),
                            IconButton(
                              padding: const EdgeInsets.only(right: 30),
                              tooltip: "Log out",
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                Get.offAll(LoginPage());
                              },
                              icon: Icon(
                                Icons.exit_to_app,
                                size: ResponseHelper.instance.fontSize * 1.90,
                                color: AppConstants.textThemeColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 22, top: 2, bottom: 4),
                        child: Text(
                          homeController.societyDetails.address,
                          style: TextStyles.regularTxtStyle
                              .copyWith(color: Colors.black87),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 22),
                        child: GestureDetector(
                          onTap: () {
                            print("more Info");
                          },
                          child: Text(
                            "Other information  ➟",
                            style: TextStyles.menuTxtStyleSemiBold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      buildFrequentlyNeedStuff(),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 22),
                        child: Text(
                          "ID Cards   ➟",
                          style: TextStyles.menuTxtStyleSemiBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildIdCardWidgets(),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 22),
                        child: Text(
                          "Facilities   ➟",
                          style: TextStyles.menuTxtStyleSemiBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildFacilitiesWidget(),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }

  buildFrequentlyNeedStuff() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildImageButton(
          name: "Notices",
          imgUrl: "Assets/note-book.png",
          onClick: () {
            Get.to(NoticePage());
          },
        ),
        buildImageButton(
          name: "Maintenance",
          imgUrl: "Assets/tool-box.png",
          onClick: () {
            showSnackBar("Your Maintenance for this year has been paid.");
          },
        ),
        buildImageButton(
          name: "Vehicles",
          imgUrl: "Assets/car.png",
          onClick: () {
            showSnackBar("You have Total of " +
                SessionData.instance.vehicleCount.toString() +
                " Vehicles.");
          },
        ),
      ],
    );
  }

  buildImageButton({String imgUrl, String name, Function onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xFF3A5160).withOpacity(0.3),
                offset: Offset(1.0, 1.0),
                blurRadius: 4.0),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imgUrl,
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyles.regboldTxtStyle,
            ),
          ],
        ),
      ),
    );
  }

  buildIdCardWidgets() {
    return SessionData.instance.idCards.isEmpty
        ? Container(
            height: ResponseHelper.instance.width * 0.35,
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF3A5160).withOpacity(0.3),
                    offset: Offset(1.0, 1.0),
                    blurRadius: 4.0),
              ],
            ),
            child: Text(
              "No ID Card Created.",
              style: TextStyles.regboldTxtStyle,
            ),
          )
        : Container(
            width: Get.width,
            height: ResponseHelper.instance.width * 0.40,
            child: ListView.builder(
              itemCount: SessionData.instance.idCards.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return IdCard(index, random.nextInt(40));
              },
            ),
          );
  }

  buildFacilitiesWidget() {
    return Container(
      height: ResponseHelper.instance.width * 0.35,
      child: ListView.builder(
        itemCount: homeController.societyDetails.facilities.length,
        itemBuilder: (_, index) {
          return Container(
            width: Get.width,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF3A5160).withOpacity(0.3),
                    offset: Offset(1.0, 1.0),
                    blurRadius: 4.0),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  getImageUrlForImage(
                      homeController.societyDetails.facilities[index]),
                  width: 40,
                ),
                const SizedBox(width: 20),
                Text(
                  homeController.societyDetails.facilities[index],
                  style: TextStyles.regboldTxtStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
