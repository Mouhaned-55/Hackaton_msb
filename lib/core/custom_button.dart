import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  final String buttonText;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.buttonColor,
      required this.buttonText,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), scaleByHeight: true, minTextAdapt: true);
    return Material(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setHeight(55),
        width: ScreenUtil().setWidth(200),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(
              color: textColor,
              fontFamily: "Tajawal",
              fontWeight: FontWeight.w700,
              fontSize: ScreenUtil().setSp(16)),
        )),
      ),
    ));
  }
}
