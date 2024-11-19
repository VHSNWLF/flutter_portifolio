import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Text('<"V.H."/>', style: TextStyle(
        fontSize: screenWidth * .02 ,
        fontWeight: FontWeight.bold,
        fontFamily: "Krypton",
        color: CustomColor.yellowSecondary
      ),
      ),
    );
  }
}