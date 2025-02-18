
import 'package:flutter/cupertino.dart';

import '../model/data/create_account_response.dart';

class CreateAccountController extends ChangeNotifier{
  CreateAccountResponse? _signUpResponse;

  CreateAccountResponse? get signUpResponse => _signUpResponse;

  set signUpResponse(CreateAccountResponse? response){
    _signUpResponse = response;
    notifyListeners();
  }
}