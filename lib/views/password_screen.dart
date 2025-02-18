import 'package:flutter/material.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../core/utils/image_utils.dart';
import '../core/utils/string_utils.dart';
import '../shared/custom_reusable_textfield.dart';

class PasswordScreen extends StatefulWidget {
  static const String routeName = "password_screen";
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  final int passLength = 8;
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.WHITE_COLOR,
      body: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            top: -280,
            left: -120,
            child: Container(
              width: screenWidth(context) * 1.9,
              height: screenHeight(context) * 1.65,
              child: Image.asset(ImageUtils.passwordBg),
            ),
          ),
          Container(
            width: screenWidth(context),
            height: screenHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(StringUtils.notu,
                          style: specialText(
                              c: ColorUtils.TEXT_GREY,
                              context: context,
                              fs: 14,
                              fw: FontWeight.normal
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        style: IconButton.styleFrom(
                            backgroundColor: ColorUtils.KPIE_GREEN
                        ),
                        onPressed: (){},
                        icon: Icon(Icons.east,
                          size: 16, color: ColorUtils.WHITE_COLOR,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 160,),
                  Container(
                    width: screenWidth(context) * .25,
                    height: screenWidth(context) * .25,
                    decoration: BoxDecoration(
                      color: ColorUtils.KPIE_PINK,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: ColorUtils.WHITE_COLOR
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(StringUtils.hello,
                          style: specialText(
                              c: ColorUtils.BLACK_COLOR,
                              context: context,
                              fs: 22,
                              fw: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 6,),
                        Text(StringUtils.userName,
                          style: specialText(
                              c: ColorUtils.BLACK_COLOR,
                              context: context,
                              fs: 22,
                              fw: FontWeight.bold
                          ),
                        ),
                        Text(StringUtils.exc,
                          style: specialText(
                              c: ColorUtils.BLACK_COLOR,
                              context: context,
                              fs: 22,
                              fw: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(StringUtils.typeYour,
                        style: specialText(
                            c: ColorUtils.TEXT_GREY,
                            context: context,
                            fs: 14,
                            fw: FontWeight.normal
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomReusableTextField(
                          controller: _passwordController,
                          borderColor: ColorUtils.TRANSPARENT_,
                          focusedBorderColor: ColorUtils.TRANSPARENT_,
                          leftMargin: 0,
                          rightMargin: 0,
                          textColor: ColorUtils.TRANSPARENT_,
                          keyboardType: TextInputType.text,
                          showCursor: false,
                          cursorColor: ColorUtils.TRANSPARENT_,
                          label: "",
                          hint: "",
                          labelColor: ColorUtils.TEXT_GREY.withOpacity(.75),
                          maxLength: passLength,
                          onChange: (value) {
                            setState(() {}); // Update rings when typing
                            if (value?.length == passLength) {
                              // Process PIN when complete
                              print("Entered PIN: $value");
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(passLength, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index < _passwordController.text.length
                                    ? ColorUtils.KPIE_GREEN
                                    : ColorUtils.KPIE_GREEN.withOpacity(.25), // Filled if entered
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2),
                          child: Text(StringUtils.forgotP,
                            style: specialText(
                                c: ColorUtils.TEXT_GREY,
                                context: context,
                                fs: 14,
                                fw: FontWeight.normal
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
