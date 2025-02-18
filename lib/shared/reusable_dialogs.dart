import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/utils/color_utils.dart';
import '../core/utils/helper.dart';
import '../core/utils/image_utils.dart';
import 'customReusableButton.dart';


Future<void> showLoadingDialog(BuildContext context, String text) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .5,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorUtils.WHITE_COLOR,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: ColorUtils.BLACK_COLOR,
                  ),
                ),
                SizedBox(width: 10,),
                Text(text,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorUtils.BLACK_COLOR,
                    fontSize: 16
                  ),
                )
              ],
            ),
          ),
        );
      }
  );
}
