import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../controllers/create_account_controller.dart';
import '../controllers/login_controller.dart';
import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../model/data/create_account_response.dart';
import '../model/data/network/app_urls.dart';
import '../model/data/user_login_response.dart';
import '../views/login_screen.dart';
class ApiHandler{
  static Future<bool> loginToApp(BuildContext context, Map<String, dynamic> loginRequest) async {
    showLoadingDialog(context, "Logging in");
    try {
      var uri = Uri.https(AppUrls.BASE_URL, AppUrls.LOGIN_URL);
      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginRequest),
      );
      if(response.statusCode == 201) {
        // context.read<LoginController>().loginResponse = UserLoginResponse.fromJson(jsonDecode(response.body));
        Navigator.of(context, rootNavigator: true).pop();
        return true;
      } else if(response.statusCode == 400) {
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }else if(response.statusCode == 404) {
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }else if(response.statusCode == 500) {
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      print('caught error ${e.toString()}');
    }
    return false;
  }

  static Future<bool> createAccount(BuildContext context, Map<String, dynamic> signUpRequest) async {
    showLoadingDialog(context, "Creating Account");
    try {
      var uri = Uri.https(AppUrls.BASE_URL, AppUrls.SIGNUP_URL);
      var response = await http.post(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(signUpRequest));
      debugPrint('response ${jsonDecode(response.body)}');
      if(response.statusCode == 200) {
        // context.read<CreateAccountController>().signUpResponse = CreateAccountResponse.fromJson(jsonDecode(response.body));
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(
            context,
            "${responseJson["message"]}",
            ColorUtils.GREEN_COLOR2,
          showAction: true,
          action: (){
              Navigator.of(context).pushNamed(LoginScreen.routeName);
          }
        );
        return true;
      } else if(response.statusCode == 400) {
        Navigator.of(context, rootNavigator: true).pop();
        debugPrint('response ${jsonDecode(response.body)}');
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson}", ColorUtils.RED_COLOR2);
        return false;
      }else {
        Navigator.of(context, rootNavigator: true).pop();
        debugPrint('response ${jsonDecode(response.body)}');
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      print('caught error ${e.toString()}');
    }
    return false;
  }

  static void showLoadingDialog(BuildContext context, String s) {}
}
