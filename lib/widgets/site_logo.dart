import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap, required this.scale});
  final double scale;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return InkWell(
      onTap: onTap,
      child: Text('<"V.H."/>', style: TextStyle(
        fontSize: scale,
        fontWeight: FontWeight.bold,
        fontFamily: "Krypton",
        color: CustomColor.yellowSecondary
      ),
      ),
    );
  }
}