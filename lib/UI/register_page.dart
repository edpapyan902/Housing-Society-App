import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_app/Controllers/register_controller.dart';
import 'package:housing_app/UI/widgets/input_text.dart';
import 'package:housing_app/helpers/app_constants.dart';
import 'package:housing_app/helpers/responsive_helper.dart';
import 'package:housing_app/helpers/text_styles.dart';

class RegisterPage extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Container(
                height: ResponseHelper.instance.height / 2.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.bottomLeft,
                    image: AssetImage(
                      "Assets/apartment_vector.png",
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 10),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 28.0,
                  right: 28.0,
                  top: Get.height / 2.5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Mover ? Register Here",
                      style: TextStyles.extralargeTxtStyleBold
                          .copyWith(color: Colors.black),
                    ),
                    InputTextField(
                      hint: "Enter Your Email",
                      controller: registerController.emailController,
                      obsecureField: false,
                    ),
                    InputTextField(
                      hint: "Enter Flat no",
                      controller: registerController.flatNoController,
                      obsecureField: false,
                    ),
                    InputTextField(
                      hint: "Enter Vehicle Count",
                      controller: registerController.vehiclesController,
                      obsecureField: false,
                    ),
                    InputTextField(
                      hint: "Enter Password",
                      controller: registerController.passController,
                      obsecureField: true,
                    ),
                    InputTextField(
                      hint: "Enter Password again",
                      controller: registerController.confirmPassController,
                      obsecureField: true,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        minWidth: ResponseHelper.instance.width * 0.45,
                        color: AppConstants.textThemeColor,
                        onPressed: () {
                          registerController.registerButtonPressed();
                        },
                        child: Text(
                          "Register",
                          style: TextStyles.largeSemiBoldTxtStyle
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
