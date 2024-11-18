import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Text('<"V.H."/>', style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: "Krypton",
        color: CustomColor.yellowSecondary
      ),),
    );
  }
}