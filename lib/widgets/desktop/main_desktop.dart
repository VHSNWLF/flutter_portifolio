// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/provider/languageProvider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.buttonTapNav});
  final Function(int) buttonTapNav;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Consumer<LanguageProvider>(
      builder: (context, language, child) {
        return Container(
        decoration: BoxDecoration(
          color: Colors.black54
        ),
        height: screenSize.height,
        constraints: BoxConstraints(
          minHeight: 350.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 AnimatedTextKit(animatedTexts: [
                            language.selectedLanguage == "English - EUA" ?
                            TyperAnimatedText("Hi,\nI'm Vitor H.S. Nascimento\nA Flutter Developer", speed: Duration(milliseconds: 100), textStyle: TextStyle(
                            fontFamily: "Krypton",
                            fontSize: 12.sp, fontWeight: FontWeight.bold, color: CustomColor.whitePrimary, height: 1.5)) : TyperAnimatedText("Olá,\nMe chamo Vitor H.S. Nascimento\nUm desenvolvedor Flutter", speed: Duration(milliseconds: 100), textStyle: TextStyle(
                            fontFamily: "Krypton",
                            fontSize: 12.sp, fontWeight: FontWeight.bold, color: CustomColor.whitePrimary, height: 1.5)),
                          ],
                          isRepeatingAnimation: false,
                          ),
                const SizedBox(height: 15,),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(onPressed: () {
                    buttonTapNav(4);
                  }, child: const Text("Get in touch", 
                  style: TextStyle(
                    fontFamily: "Krypton",
                    color: Colors.black, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 15
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowPrimary
                  )
                  ),
                )
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
                maxHeight: 500
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/Vitor.jpg",
                  width: screenWidth / 3,
                  height: screenWidth / 3, // Defina a altura igual à largura para torná-la circular
                  fit: BoxFit.cover, // Preenche a área para cobrir o espaço
                ),
              ),
            )
          ],
        ),
      );
      },
      
    );
  }
}