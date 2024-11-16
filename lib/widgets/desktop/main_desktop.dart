// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.buttonTapNav});
  final Function(int) buttonTapNav;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
                margin: EdgeInsets.symmetric(horizontal: 20,),
                height: screenSize.height/1.2,
                constraints: BoxConstraints(
                  minHeight: 350.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hi,\nI'm Vitor H.S. Nascimento\nA Flutter Developer", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: CustomColor.whitePrimary, height: 1.5),),
                        const SizedBox(height: 15,),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(onPressed: () {
                            buttonTapNav(3);
                          }, child: const Text("Get in touch", 
                          style: TextStyle(
                            color: CustomColor.whitePrimary, 
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
  }
}