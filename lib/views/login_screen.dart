import 'package:flutter/material.dart';
import 'package:kpie_app/core/utils/color_utils.dart';
import 'package:kpie_app/core/utils/helper.dart';
import 'package:kpie_app/core/utils/image_utils.dart';
import 'package:kpie_app/core/utils/string_utils.dart';
import 'package:kpie_app/shared/customReusableButton.dart';
import 'package:kpie_app/shared/custom_reusable_textfield.dart';
import 'package:kpie_app/views/password_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.WHITE_COLOR,
      body: Stack(
        children: [
          Positioned(
            top: -280,
            left: -120,
            child: Container(
              width: screenWidth(context) * 1.9,
              height: screenHeight(context) * 1.65,
              child: Image.asset(ImageUtils.bg),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(StringUtils.loginText,
                      style: specialText(
                        c: ColorUtils.BLACK_COLOR,
                        context: context,
                        fs: 22,
                        fw: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(StringUtils.goodToSeeU,
                          style: specialText(
                            c: ColorUtils.BLACK_COLOR,
                            context: context,
                            fs: 14,
                            fw: FontWeight.normal
                          ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.favorite_outlined,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: CustomReusableTextField(
                    controller: _emailController,
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
                  ),
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
                      Navigator.of(context).pushNamed(PasswordScreen.routeName);
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
        ],
      ),
    );
  }
}
