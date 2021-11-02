import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housing_app/Controllers/login_controller.dart';
import 'package:housing_app/UI/register_page.dart';
import 'package:housing_app/UI/widgets/input_text.dart';
import 'package:housing_app/helpers/app_constants.dart';
import 'package:housing_app/helpers/responsive_helper.dart';
import 'package:housing_app/helpers/text_styles.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

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
                      )),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
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
                      "Login",
                      style: TextStyles.extralargeTxtStyleBold
                          .copyWith(color: Colors.black),
                    ),
                    InputTextField(
                      hint: "Enter Your Email-Id",
                      controller: loginController.emailController,
                      obsecureField: false,
                    ),
                    InputTextField(
                      hint: "Enter Password",
                      controller: loginController.passController,
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
                          loginController.loginButtonPressed(
                              loginController.emailController.text,
                              loginController.passController.text);
                        },
                        child: Text(
                          "Login",
                          style: TextStyles.largeSemiBoldTxtStyle
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Get.width * 0.75,
                      height: 2,
                      color: Colors.black26,
                    ),
                    SizedBox(height: 10),
                    FlatButton(
                      onPressed: () {
                        Get.to(RegisterPage());
                      },
                      child: Text(
                        "New Mover ? Register now",
                        style: TextStyles.regboldTxtStyle,
                      ),
                    ),
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
