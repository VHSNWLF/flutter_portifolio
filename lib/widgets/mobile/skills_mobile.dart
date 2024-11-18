import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/skill_items.dart';
import 'package:flutter_svg/svg.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500
      ),
      child: Column(
        children: [
          //Plataforms
          for(int i=0; i< plataformItems.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: CustomColor.bgLight2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              leading: Image.asset(plataformItems[i]["img"], width: 26, color: Colors.white,),
              title: Text(plataformItems[i]["title"], style: const TextStyle(fontFamily: "Krypton",color: CustomColor.yellowSecondary),),
            ),
          ),
          const SizedBox(height: 50,),
      
          //Skills
          Wrap(
            spacing: 10, runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i=0; i<skillItems.length; i++)
                Chip(
                  backgroundColor: CustomColor.bgLight2,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  label: Text(skillItems[i]["title"], style: const TextStyle(fontFamily: "Krypton", color: CustomColor.yellowSecondary),), avatar: SvgPicture.asset(skillItems[i]["img"]),
                ),
            ],
          )
      
        ],
      ),
    );
  }
}