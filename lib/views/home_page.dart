

import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/size.dart';
import 'package:flutter_portifolio/widgets/contact_section.dart';
import 'package:flutter_portifolio/widgets/mobile/drawer_mobile.dart';
import 'package:flutter_portifolio/widgets/desktop/header_desktop.dart';
import 'package:flutter_portifolio/widgets/mobile/header_mobile.dart';
import 'package:flutter_portifolio/widgets/desktop/main_desktop.dart';
import 'package:flutter_portifolio/widgets/mobile/main_mobile.dart';
import 'package:flutter_portifolio/widgets/projects_section.dart';
import 'package:flutter_portifolio/widgets/desktop/skills_desktop.dart';
import 'package:flutter_portifolio/widgets/mobile/skills_mobile.dart';

import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  bool scrolled = false;
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey(),);

@override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // Verifica se a rolagem foi para baixo
      bool isScrolledDown = scrollController.position.pixels > 100;
      if (isScrolledDown != scrolled) {
        setState(() {
          scrolled = isScrolledDown;  // Atualiza a variável apenas quando necessário
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer:constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(onNavItemTap: (int index) {
            //call func
            scrollToSection(index);
            scaffoldKey.currentState?.closeEndDrawer();
          },),
          backgroundColor: CustomColor.scaffoldBg,
          body: Stack(
            children: [
              // 1. Animação de fundo
            Positioned.fill(
              child: Lottie.asset(
                'assets/animation/Animation.json',
                fit: BoxFit.cover, // Preenche o fundo
                repeat: true,      // Loop infinito
              ),
            ),
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(key: navBarKeys.first,),
                    // MAIN
              
                    if(constraints.maxWidth>=kMinDesktopWidth)
                    MainDesktop(buttonTapNav: (int index) {
                      scrollToSection(index);
                    },) else const MainMobile(),
              
                    // SKILLS
                    Container(
                      key: navBarKeys[1],
                      width: screenWidth,
                      color: CustomColor.bgLight1,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          
                          //title
                          const Text("What I can do", style: TextStyle(
                            fontFamily: "Krypton",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),),
                          const SizedBox(height: 30,),
                //
                          //plataforms and skills
                          if(constraints.maxWidth>=kMedDesktopWidth)
                          const SkillsDesktop() else const SkillsMobile()
                          
                        ],
                      ),
                    ),
                        //
                    // PROJECTS
                    ProjectsSection(key: navBarKeys[2],),
                //
                    //const SizedBox(height: 30,),
                        
                    // CONTACT
                    Container(
                      width: double.maxFinite,
                      child: ContactSection(key: navBarKeys[3],)),
                        
                    // FOOTER
                    Container(
                      height: 100,
                      width: double.maxFinite,
                      child: const Center(child: Text("Made by Vitor H.S Nascimento with a youtube tutorial by Shohruh AK.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Krypton",
                        color: CustomColor.whiteSecondary, fontWeight: FontWeight.w400),)),
                    ),
                  ],
                ),
              ),
              Positioned(child: constraints.maxWidth>=kMinDesktopWidth ?
                    HeaderDesktop(
                      onLogoTap: () {
                        scrollToSection(0);
                      },
                      scrolled: scrolled,
                      onNavMenuTap: (int index) {
                      //call func
                      scrollToSection(index);
                    },) :
                    HeaderMobile(
                      scrolled: scrolled,
                      onLogoTap: () {
                        scrollToSection(0);
                      },
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),),
            ],
          )
        );
      }
    );
  }

void scrollToSection(int navIndex) {
  final key = navBarKeys[navIndex];
  if (key.currentContext != null) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800), // Duração mais longa para suavidade
      curve: Curves.easeInOutCubic, // Curva mais suave
    );
  }
}

}
