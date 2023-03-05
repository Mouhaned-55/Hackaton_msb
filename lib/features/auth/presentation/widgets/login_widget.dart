import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_msb/core/custom_button.dart';
import 'package:hackaton_msb/core/custom_text_field.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 100.h),
          Center(
              child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/login_logo.svg",
                width: 200.w,
                height: 200.h,
              ),
              Text(
                "Welcome Again",
                style: TextStyle(
                    fontSize: 19.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              CustomTextField(hintText: "Enter your code", obscureText: true),
              SizedBox(height: 30.h),
              CustomButton(
                  onTap: () {},
                  buttonColor: Color(0xFF59caba),
                  buttonText: "Login",
                  textColor: Colors.white)
            ],
          ))
        ],
      ),
    ));
  }
}
