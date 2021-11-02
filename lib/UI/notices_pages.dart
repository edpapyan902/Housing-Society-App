import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_app/Controllers/home_controller.dart';
import 'package:housing_app/helpers/app_constants.dart';
import 'package:housing_app/helpers/responsive_helper.dart';
import 'package:housing_app/helpers/text_styles.dart';
import 'package:housing_app/helpers/ui_helpers.dart';

class NoticePage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 22, top: 10, right: 30),
            child: Column(
              children: [
                buildTitleWidget(),
                buildComplaintsUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          tooltip: "Create new Complaint",
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: ResponseHelper.instance.fontSize * 1.5,
            color: AppConstants.textThemeColor,
          ),
        ),
        Text(
          "Complaints",
          style:
              TextStyles.extralargeTxtStyleBold.copyWith(color: Colors.black87),
        ),
        IconButton(
          tooltip: "Create new Complaint",
          onPressed: () {
            showSnackBar("Coming Soon");
          },
          icon: Icon(
            Icons.create,
            size: ResponseHelper.instance.fontSize * 1.5,
            color: AppConstants.textThemeColor,
          ),
        )
      ],
    );
  }

  buildComplaintsUI() {
    return Container(
      height: ResponseHelper.instance.height * 0.85,
      margin: const EdgeInsets.only(bottom: 30),
      child: ListView.builder(
        itemCount: homeController.societyDetails.complaints.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Container(
            width: Get.width * 0.80,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF3A5160).withOpacity(0.3),
                    offset: Offset(1.0, 1.0),
                    blurRadius: 4.0),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ResponseHelper.instance.width * 0.5,
                    child: Image.network(
                      homeController.societyDetails.complaints[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    homeController.societyDetails.complaints[index].name,
                    style: TextStyles.menuTxtStyleSemiBold
                        .copyWith(color: Colors.black87),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    homeController.societyDetails.complaints[index].description,
                    style: TextStyles.regularTxtStyle
                        .copyWith(color: Colors.black87),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    homeController.societyDetails.complaints[index].date,
                    style: TextStyles.menuTxtStyleSemiBold
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
