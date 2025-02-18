import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kpie_app/core/utils/image_utils.dart';
import 'package:kpie_app/shared/custom_reusable_divider.dart';
import 'package:kpie_app/views/login_screen.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../core/utils/string_utils.dart';
import '../services/api_handler.dart';
import '../shared/customReusableButton.dart';
import '../shared/custom_reusable_textfield.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up_screen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  final  ValueNotifier<bool> _hidePassword = ValueNotifier<bool >(false);
  final formKey = GlobalKey<FormState>();

  String flagText = StringUtils.ngflag;
  String phCode = StringUtils.ngCode;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.WHITE_COLOR,
      body: Stack(
        children: [
          Positioned(
            top: -350,
            left: -120,
            child: Container(
              width: screenWidth(context) * 1.9,
              height: screenHeight(context) * 1.65,
              child: Image.asset(ImageUtils.signUpbg),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(StringUtils.createAcctText,
                          style: specialText(
                              c: ColorUtils.BLACK_COLOR,
                              context: context,
                              fs: 32,
                              fw: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(150)
                              )
                            ),
                              onPressed: (){},
                              icon: Image.asset(ImageUtils.uploadPhoto)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomReusableTextField(
                        controller: _emailController,
                        maxLength: 40,
                        fillColor: ColorUtils.KPIE_DARK_WHITE.withOpacity(.65),
                        filled: true,
                        borderColor: ColorUtils.TRANSPARENT_,
                        focusedBorderColor: ColorUtils.TRANSPARENT_,
                        leftMargin: 0,
                        rightMargin: 0,
                        keyboardType: TextInputType.emailAddress,
                        label: StringUtils.emailLabel,
                        hint: StringUtils.emailLabel,
                        labelColor: ColorUtils.TEXT_GREY.withOpacity(.75),
                        validator: (value) => emailValidator(value),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 18.0),
                    //   child:
                    // ),
                    ValueListenableBuilder(
                      valueListenable: _hidePassword,
                      builder: (context, value, child) {
                        return CustomReusableTextField(
                          controller: _passwordController,
                          maxLength: 40,
                          fillColor: ColorUtils.KPIE_DARK_WHITE.withOpacity(.65),
                          filled: true,
                          passwordField: _hidePassword.value,
                          borderColor: ColorUtils.TRANSPARENT_,
                          focusedBorderColor: ColorUtils.TRANSPARENT_,
                          leftMargin: 18,
                          rightMargin: 18,
                          keyboardType: TextInputType.text,
                          label: StringUtils.passwordLabel,
                          hint: StringUtils.passwordLabel,
                          labelColor: ColorUtils.TEXT_GREY.withOpacity(.75),
                          sufIcon: SizedBox(
                            width: 10,
                            child: IconButton(
                                onPressed: (){
                                  _hidePassword.value = !_hidePassword.value;
                                }, icon: Icon(_hidePassword.value ? Icons.visibility_outlined:Icons.visibility_off_outlined,
                              size: 16,
                            )),
                          ),
                          validator: (value) => passwordValidator(value),
                        );
                      }),
                    CustomReusableTextField(
                        controller: _phoneNumberController,
                        fillColor: ColorUtils.KPIE_DARK_WHITE.withOpacity(.65),
                        filled: true,
                        borderColor: ColorUtils.TRANSPARENT_,
                        focusedBorderColor: ColorUtils.TRANSPARENT_,
                        leftMargin: 18,
                        rightMargin: 18,
                        keyboardType: TextInputType.number,
                        label: StringUtils.phoneLabel,
                        hint: StringUtils.phoneLabel,
                        labelColor: ColorUtils.TEXT_GREY.withOpacity(.75),
                        prefIcon: IconButton(
                          onPressed: (){
                            print('bottom');
                            phoneCodeBottomsheet();
                          },
                          icon: Container(
                            width: 45,
                            height: 25,
                            margin: EdgeInsets.only(left: 15, top: 10.0, right: 15, bottom: 10.0),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                                border: Border(
                                    right: BorderSide(
                                        width: 1.5,
                                        color: ColorUtils.TEXT_GREY
                                    )
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(flagText),
                                Icon(Icons.keyboard_arrow_down,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                        ),
                        validator: (value) => phoneNumberValidator(value),
                      ),
                    SizedBox(height: 20,),
                    CustomReusableButton(
                        buttonTitle: StringUtils.next,
                        titleColor: ColorUtils.WHITE_COLOR,
                        fontWeight: FontWeight.w300,
                        buttonColor: ColorUtils.KPIE_GREEN,
                        borderRadius: 12,
                        left: 18, right: 18,
                        function: (){
                          _submit(context);
                          // Navigator.of(context).pushNamed(LoginScreen.routeName);
                        }),
                    SizedBox(height: 10,),
                    CustomReusableButton(
                        buttonTitle: StringUtils.cancel,
                        titleColor: ColorUtils.TEXT_GREY,
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        buttonColor: ColorUtils.TRANSPARENT_,
                        borderRadius: 12,
                        left: 18, right: 18,
                        function: (){}),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _submit(BuildContext context) async {
    if(formKey.currentState!.validate()){
      Map<String, dynamic> data = {
        "email": _emailController.text.trim(),
        "phone_num": formatPhoneNumber(_phoneNumberController.text.trim(), phCode),//phCode+_phoneNumberController.text.trim(),
        "password": _passwordController.text.trim(),
        "server_key": "3fac1bb71fd9088c8365d8fc9bfa546544a903ea-c7ad5ccda5d17029ba77a0aa60c550c4-15271686",
        "username":"username",
        "confirm_password": "confirmpassword",
        "gender": "female",
        "first_name": "first name",
        "last_name": "last name",
      };
      print('CREATE ACCOUNT REQUEST $data');
      // bool done = await ApiHandler.createAccount(context, data);
      // if(done){
      //   // _firstnameController.clear();
      //   // _lastnameController.clear();
      //   // _emailController.clear();
      //   // _phoneNumberController.clear();
      //   // _passwordController.clear();
      //   // _confirmPasswordController.clear();
      //   // Navigator.of(context).pushNamed(NavScreen.routeName,
      //   //   arguments: 0
      //   // );
      // }
    }
  }
  String formatPhoneNumber(String phoneNumber, String countryCode) {
    if (phoneNumber.startsWith('0') && phCode == StringUtils.ngCode) {
      return '$countryCode' + phoneNumber.substring(1); // Remove leading 0 and prepend country code
    }
    return '$countryCode$phoneNumber'; // Prepend country code if no leading 0
  }
  phoneCodeBottomsheet(){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(StringUtils.phCodes,
              style: specialText(
                context: context,
                fs: 18,
                fw: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                CustomReusableDivider(
                  height: 0,
                  color: ColorUtils.KPIE_GREEN,
                ),
                SizedBox(
                  height: 230,
                  child: phoneCodeList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> phoneCodeListData = [
    {
      "country": "Nigeria",
      "code": StringUtils.ngCode,
      "flag": StringUtils.ngflag,
    },
    {
      "country": "Ghana",
      "code": StringUtils.ghCode,
      "flag": StringUtils.ghflag,
    },
    {
      "country": "Cameroun",
      "code": StringUtils.camerounCode,
      "flag": StringUtils.camerounflag,
    },
    {
      "country": "South Africa",
      "code": StringUtils.saCode,
      "flag": StringUtils.saflag,
    },
    {
      "country": "Egypt",
      "code": StringUtils.egyptCode,
      "flag": StringUtils.egyptFlag,
    },
    {
      "country": "United States of America",
      "code": StringUtils.usCode,
      "flag": StringUtils.usFlag,
    },
    {
      "country": "United Kingdom",
      "code": StringUtils.ukCode,
      "flag": StringUtils.ukFlag,
    },
  ];
  phoneCodeList(/*List<Map<String, dynamic>> data*/){
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: phoneCodeListData.length,
        itemBuilder: (context, index){
        var eachItem = phoneCodeListData[index];
      return Column(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)
              )
            ),
              onPressed: (){
              setState(() {
                flagText = eachItem["flag"];
                phCode = eachItem["code"];
                print(" phCode $phCode");
                    });
              Navigator.pop(context);
              },
              icon: ListTile(
            leading: Text(eachItem["flag"],
              style: specialText(
                  context: context,
                  fs: 22
              ),
            ),
            title: Text(eachItem["country"],
              style: specialText(
                  context: context,
                  fs: 16,
                  fw: FontWeight.bold
              ),
            ),
            subtitle: Text(eachItem['code']),
          )),
          CustomReusableDivider(
            height: 0,
            color: ColorUtils.KPIE_GREEN,
          )
        ],
      );
    });
  }
}
