// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                constraints: BoxConstraints(minHeight: 560.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //avatar img
                    Center(
                      child: ClipOval(
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(colors: [
                              CustomColor.scaffoldBg.withOpacity(0.4),
                              CustomColor.scaffoldBg.withOpacity(0.4),
                            ]).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: Image.asset(
                            "assets/images/Vitor.jpg",
                            width: screenWidth/2,
                            height: screenWidth/2, // Defina a altura igual à largura para torná-la circular
                            fit: BoxFit.cover, // Preenche a área para cobrir o espaço
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 30,),

                    //intro text
                    Center(
                      child: AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText("Hi,\nI'm Vitor H.S. Nascimento\nA Flutter Developer", speed: Duration(milliseconds: 100), textStyle: TextStyle(
                        fontFamily: "Krypton",
                        fontSize: 24.sp, fontWeight: FontWeight.bold, color: CustomColor.whitePrimary, height: 1.5), textAlign: TextAlign.center),
                      ],
                      isRepeatingAnimation: false,
                      ),
                    ),
                    SizedBox(height: 20,),
                    

                    //btn
                    SizedBox(
                      width: 250,
                      child: Center(
                        child: ElevatedButton(onPressed: () {
                          
                        }, child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Get in touch", 
                          style: TextStyle(
                            fontFamily: "Krypton",
                            color: CustomColor.whitePrimary, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 15.sp
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.yellowPrimary
                        ),
                        ),
                      ),
                    )

                  ],
                ),
              );
  }
}