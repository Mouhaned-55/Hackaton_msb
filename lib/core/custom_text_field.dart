// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  //final String hintText;
  const CustomTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: "Tajawal",
                  color: Color(0xFF999999).withOpacity(0.4),
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent),
              ),
              fillColor: Colors.grey.shade200,
              filled: false)),
    );
  }
}