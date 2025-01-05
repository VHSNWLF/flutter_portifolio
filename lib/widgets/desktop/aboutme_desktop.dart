import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMeDesktop extends StatefulWidget {
  const AboutMeDesktop({super.key,});

  @override
  State<AboutMeDesktop> createState() => _AboutMeDesktopState();
}

class _AboutMeDesktopState extends State<AboutMeDesktop> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    decoration: const BoxDecoration(
      color: Colors.black26,
    ),
    child: Column(
      children: [
        //title
        Text("About me", style: TextStyle(
          fontFamily: "Krypton",
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: CustomColor.whitePrimary,
        ),),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Hi, my name is Vitor, I'm 18 years old, and I'm passionate about technology and software development. I currently live in Limeira, and my goal is to apply my skills to create real-world solutions through freelance projects and collaborations with other individuals or companies.\nI have experience with Flutter, Java, and Spring Boot, and I'm always driven by the continuous pursuit of learning and new challenges. I believe that hands-on experience and constant improvement are key to becoming a better professional, which is why I'm always exploring new languages and frameworks.\nSo far, I've developed a few personal projects that have helped me refine my technical skills and problem-solving abilities. My goal is to keep growing as a developer, applying my knowledge creatively and efficiently, and I'm open to new projects that allow me to expand my expertise further.\nIf you have an idea or an interesting project, I'd be happy to chat and explore ways to collaborate!", style: TextStyle(
                  fontFamily: "Krypton",
                  fontSize: 5.sp,
                  color: CustomColor.whitePrimary,
                ),),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
}