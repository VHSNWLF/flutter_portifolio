import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
  this.controller,
  this.maxLines=1,
  this.hintText,
  });
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: CustomColor.hintDark,
      controller: controller,
      maxLines: maxLines,
  style: const TextStyle(
    fontFamily: "Krypton",
    color: CustomColor.scaffoldBg,
  ),
  decoration: InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      fontFamily: "Krypton",
      color: CustomColor.hintDark,
    ),
    contentPadding: const EdgeInsets.all(16),
    filled: true,
    fillColor: CustomColor.whiteSecondary,
    focusedBorder: getInputBorder,
    enabledBorder: getInputBorder,
    border: getInputBorder,
  ),
);
}
OutlineInputBorder get getInputBorder {
return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none,
    );
  }
}