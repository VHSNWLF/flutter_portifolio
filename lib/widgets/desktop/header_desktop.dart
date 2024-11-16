// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/nav_items.dart';
import 'package:flutter_portifolio/styles/style.dart';
import 'package:flutter_portifolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: () {
            
          },),
          Spacer(),
          for(int i=0; i<navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(onPressed: () {
                onNavMenuTap(i);
              }, child: Text(navTitles[i], style: TextStyle(color: CustomColor.whitePrimary, fontSize: 16),),),
            ),
        ],
      ),
    );
  }
}