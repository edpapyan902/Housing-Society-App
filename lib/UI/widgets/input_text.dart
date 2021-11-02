import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housing_app/helpers/app_constants.dart';
import 'package:housing_app/helpers/text_styles.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obsecureField;

  InputTextField({this.hint, this.controller, this.obsecureField});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureField,
      decoration: InputDecoration(
        hintText: hint,
        labelStyle: TextStyles.medTxtStyle.copyWith(color: Colors.black),
        hintStyle: TextStyles.medTxtStyle,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppConstants.textThemeColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
