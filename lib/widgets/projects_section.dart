import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/size.dart';
import 'package:flutter_portifolio/utils/projects_utils.dart';
import 'package:flutter_portifolio/widgets/project_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    List<ProjectsUtils> workProjects = [
    ];

    List<ProjectsUtils> hobbyProjects = [
      ProjectsUtils(
        "assets/projects/EcoMoment.png", 
        "EcoMoment", 
        "EcoMoment ment ment ment", 
        "www.androidlink.com", 
        "www.ioslink.com", 
        "https://www.google.com"
      ),      
    ];
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return
      Container(
      decoration: BoxDecoration(color: Colors.black26),
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      width: screenWidth,
      child:  Column(
        children: [
          //Work Project title
          Text("Work Projects", style: TextStyle(
            fontFamily: "Krypton",
            fontSize: constraints.maxWidth>=kMinDesktopWidth ? 10.sp : 30.sp,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),),
          const SizedBox(height: 20,),

          //Work Porjects cards
          workProjects.isEmpty ? const Center(child: Text("None", style: TextStyle(
            color: CustomColor.whitePrimary,
            fontSize: 15,
          ),),) :
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                for(int i=0; i<workProjects.length; i++)
                ProjectCardWidget(listaProjetos: workProjects[i],),
              ],
            ),
          ),

          const SizedBox(height: 20,),
          //Hobby Project title
          Text("Hobby Projects", style: TextStyle(
            fontFamily: "Krypton",
            fontSize: constraints.maxWidth>=kMinDesktopWidth ? 10.sp : 30.sp,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),),
          const SizedBox(height: 20,),

          //Hobby Porjects cards
          hobbyProjects.isEmpty ? Center(child: Text("None", style: TextStyle(
            fontFamily: "Krypton",
            color: CustomColor.whitePrimary,
            fontSize: constraints.maxWidth>=kMinDesktopWidth ? 10.sp : 30.sp,
          ),),) :
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                for(int i=0; i<hobbyProjects.length; i++)
                ProjectCardWidget(listaProjetos: hobbyProjects[i],),
              ],
            ),
          ),
        ],
      ),
    );
    },);
  }
}