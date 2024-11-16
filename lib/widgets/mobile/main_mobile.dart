// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text("Hi,\nI'm Vitor H.S. Nascimento\nA Flutter Developer", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: CustomColor.whitePrimary, height: 1.5),),
                    

                    //btn
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(onPressed: () {
                        
                      }, child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text("Get in touch", 
                        style: TextStyle(
                          color: CustomColor.whitePrimary, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 15
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowPrimary
                      ),
                      ),
                    )

                  ],
                ),
              );
  }
}