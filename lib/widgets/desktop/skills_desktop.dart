import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/skill_items.dart';
import 'package:flutter_svg/svg.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({super.key});

  @override
  _SkillsDesktopState createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop> {
  List<bool> isHoveredListSkills = List.generate(skillItems.length, (index) => false,);
  List<bool> isHoveredListPlataforms = List.generate(plataformItems.length, (index) => false,);
  Color hoveredTextColor = CustomColor.yellowSecondary;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Plataforms
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int i = 0; i < 2; i++)
                MouseRegion(
                  onEnter: (event) {
                    isHoveredListPlataforms[i] = true;
                    setState(() {
                      
                    });
                  },
                  onExit: (event) {
                    isHoveredListPlataforms[i] = false;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: isHoveredListPlataforms[i] ? CustomColor.yellowSecondary : CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: Image.asset(
                        plataformItems[i]["img"],
                        width: 30,
                      ),
                      title: Text(
                        plataformItems[i]["title"],
                        style: TextStyle(
                            fontFamily: "Krypton", color: isHoveredListPlataforms[i] ? Colors.white : CustomColor.yellowSecondary),
                      ),
                    ),
                  ),
                ),
              Center(
                child: MouseRegion(
                  onEnter: (event) {
                    isHoveredListPlataforms[2] = true;
                    setState(() {
                      
                    });
                  },
                  onExit: (event) {
                    isHoveredListPlataforms[2] = false;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: isHoveredListPlataforms[2] ? CustomColor.yellowSecondary : CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: Image.asset(
                        plataformItems[2]["img"],
                        width: 30,
                      ),
                      title: Text(
                        plataformItems[2]["title"],
                        style: TextStyle(
                            fontFamily: "Krypton", color: isHoveredListPlataforms[2] ? Colors.white : CustomColor.yellowSecondary),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 50),

        // Skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        isHoveredListSkills[i] = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        isHoveredListSkills[i] = false;
                      });
                    },
                    child: Chip(
                      backgroundColor: isHoveredListSkills[i] ? CustomColor.yellowSecondary : CustomColor.bgLight2,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      label: Text(
                        skillItems[i]["title"],
                        style: TextStyle(
                            fontFamily: "Krypton", color: isHoveredListSkills[i] ? Colors.white : CustomColor.yellowSecondary),
                      ),
                      avatar: SvgPicture.asset(skillItems[i]["img"]),
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
