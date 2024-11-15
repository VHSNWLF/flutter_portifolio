

import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/nav_items.dart';
import 'package:flutter_portifolio/constants/size.dart';
import 'package:flutter_portifolio/constants/skill_items.dart';
import 'package:flutter_portifolio/styles/style.dart';
import 'package:flutter_portifolio/utils/projects_utils.dart';
import 'package:flutter_portifolio/widgets/drawer_mobile.dart';
import 'package:flutter_portifolio/widgets/header_desktop.dart';
import 'package:flutter_portifolio/widgets/header_mobile.dart';
import 'package:flutter_portifolio/widgets/main_desktop.dart';
import 'package:flutter_portifolio/widgets/main_mobile.dart';
import 'package:flutter_portifolio/widgets/project_card.dart';
import 'package:flutter_portifolio/widgets/site_logo.dart';
import 'package:flutter_portifolio/widgets/skills_desktop.dart';
import 'package:flutter_portifolio/widgets/skills_mobile.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer:constraints.maxWidth >= kMinDesktopWidth ? null : const DrawerMobile(),
          backgroundColor: CustomColor.scaffoldBg,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
        
              // MAIN
              //if(constraints.maxWidth>=kMinDesktopWidth)
              //const HeaderDesktop() else
              //HeaderMobile(
              //  onLogoTap: () {},
              //  onMenuTap: () {
              //    scaffoldKey.currentState?.openEndDrawer();
              //  },
              //),
//
              //if(constraints.maxWidth>=kMinDesktopWidth)
              //const MainDesktop() else const MainMobile(),
//
              //// SKILLS
              //Container(
              //  width: screenWidth,
              //  color: CustomColor.bgLight1,
              //  padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
              //  child: Column(
              //    mainAxisSize: MainAxisSize.min,
              //    children: [
              //      
              //      //title
              //      const Text("What I can do", style: TextStyle(
              //        fontSize: 24,
              //        fontWeight: FontWeight.bold,
              //        color: CustomColor.whitePrimary,
              //      ),),
              //      const SizedBox(height: 30,),
//
              //      //plataforms and skills
              //      if(constraints.maxWidth>=kMedDesktopWidth)
              //      const SkillsDesktop() else const SkillsMobile()
              //      
              //    ],
              //  ),
              //),
        
              // PROJECTS
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                child: Column(
                  children: [
                    //Work Project title
                    const Text("Work Projects", style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),),
                    const SizedBox(height: 20,),

                    //Work Porjects cards
                    //ProjectCardWidget(projects: ProjectsUtils.n().hobbyProjectsUtils.first)
                  ],
                ),
              ),
        
              // CONTACT
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
        
              // FOOTER
              Container(
                height: 500,
                width: double.maxFinite,
              ),
            ],
          )
        );
      }
    );
  }
}
