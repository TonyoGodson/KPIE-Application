import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/data/user_login_response.dart';

class LoginController extends ChangeNotifier{
  UserLoginResponse? _loginResponse;

  UserLoginResponse? get loginResponse => _loginResponse;

  set loginResponse(UserLoginResponse? response){
    _loginResponse = response;
    notifyListeners();
  }
}