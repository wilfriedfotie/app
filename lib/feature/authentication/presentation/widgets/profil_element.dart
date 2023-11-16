import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';

Widget profileItem(
        {required Size screenSize,
        required String title,
        required Function onPressed}) =>
    Container(
      child: Column(
        children: [
          SizedBox(
            height: dimensH(screenSize.height * .07),
            width: double.maxFinite,
            child: FancyButton(
              size: 15,
              color: AppTheme.whiteColor,
              onPressed: () {
                print("go to detail $title");
                onPressed();
              },
              duration: const Duration(milliseconds: 160),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenSize.width * .07,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$title",
                      style: TextStyle(
                          fontSize:
                              dimensH(2.9 * SizeConfig.textMultiplier, sm: 22),
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textBlackV2Color),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppTheme.textBlackV2Color,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: dimensH(screenSize.height * .04),
          )
        ],
      ),
    );
