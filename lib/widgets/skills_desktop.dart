import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/skill_items.dart';
import 'package:flutter_svg/svg.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        //Plataforms
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450
          ),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for(int i=0; i<2; i++)
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: CustomColor.bgLight2,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  leading: Image.asset(plataformItems[i]["img"], width: 30,),
                  title: Text(plataformItems[i]["title"]),
                ),
              ),
              Center(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: Image.asset(plataformItems[2]["img"], width: 30,),
                    title: Text(plataformItems[2]["title"]),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 50,),

        //Skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Wrap(
              runSpacing: 10, spacing: 10,
              children: [
                for (int i=0; i<skillItems.length; i++)
                Chip(
                  backgroundColor: CustomColor.bgLight2,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  label: Text(skillItems[i]["title"]), avatar: SvgPicture.asset(skillItems[i]["img"]),)
              ],
            ),
          ),
        )

      ],
    );
  }
}