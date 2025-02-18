import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'color_utils.dart';
import 'constants.dart';
showSnackbar(BuildContext context, String msg, Color color, {bool? showAction, VoidCallback? action}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ColorUtils.WHITE_COLOR
        )),
        backgroundColor: color,
        duration: Duration(seconds:showAction??false ? 60: 3),
        action: showAction??false ? SnackBarAction(
          textColor: ColorUtils.KPIE_BLUE,
            backgroundColor: ColorUtils.WHITE_COLOR,
            label: "Ok", onPressed: action??(){}):null,
      ));
}

 screenWidth(BuildContext context)  {
   return MediaQuery.of(context).size.width;
 }

  screenHeight(BuildContext context)  {
    return MediaQuery.of(context).size.height;
  }

specialText({required BuildContext context, Color? c, bool? b, FontWeight? fw, double? fs, ht, FontStyle? fst}){
  return Theme.of(context).textTheme.bodyLarge?.copyWith(
    color: c,
    // fontFamily: 'Imprima',
    fontStyle: fst??FontStyle.normal,
    fontSize: fs??10,
    height: ht??1.5,
    // fontFamily: 'Work Sans',
    fontWeight: b??false?FontWeight.bold:(fw??FontWeight.normal),
    // fontFamily: poppins
  );
}



void onChangeFocusNode(BuildContext context, currentFocusNode, nextFocusNode){
  currentFocusNode.unfocus;

  FocusScope.of(context).requestFocus(nextFocusNode);
}

  firstNameValidator(String? fname){
    if (fname == null || fname.isEmpty) {
      return "Enter your first name";
    }
    return null;
  }

  lastNameValidator(String? lname){
    if (lname == null || lname.isEmpty) {
      return "Enter your last name";
    }
    return null;
  }

  emailValidator(String? value){
      if (value == null || value.trim().isEmpty) {
        return "Please enter an email";
      }
      // Regex for a valid email format
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(value)) {
        return "Enter a valid email address";
      }
      return null;
  }

  phoneNumberValidator(String? number){
      if (number == null || number.isEmpty) {
        return "Enter your phone number";
      }
      if (number.length < 10) {
        return "Invalid phone number";
      }
      return null;
  }

  passwordValidator(String? value){
    if (value == null || value.isEmpty) {
      return "Enter a password";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return "Password must contain at least one number";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  cPasswordValidator(String? password, cPassword){
    if (password == null || password.isEmpty) {
      return "Enter a password first";
    }
    if (cPassword == null || cPassword.isEmpty) {
      return "Confirm your a password";
    }
    if (cPassword != password) {
      return "Passwords do not match.";
    }
    return null;
  }