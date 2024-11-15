import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/utils/projects_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.projects
  });

  final ProjectsUtils projects;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 320,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //project image
          Image.asset(projects.image,height: 140, width: 250, fit: BoxFit.cover,),
    
          //project title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
            child: Text(projects.title ,maxLines: 1,overflow: TextOverflow.ellipsis, style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: CustomColor.whitePrimary,),
            ),
          ),
    
          //project subtitle
           Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(projects.subtitle,maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(
              fontSize: 15,
              color: CustomColor.whiteSecondary,),
            ),
          ),
          const Spacer(),
    
          //Footer
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
            child: Row(
              children: [
                const Text("Availabe on: ", style: TextStyle(
                  color: CustomColor.yellowSecondary,
                  fontSize: 15,
                ),),
                const Spacer(),
    
                if(projects.androidLink!=null)
                InkWell(
                  onTap: () {
                    js.context.callMethod("open",[projects.androidLink]);
                  },
                  child: Image.asset("assets/icons/androidBranco.png", height: 30,)),
    
                if(projects.iosLink!=null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      js.context.callMethod("open",[projects.iosLink]);
                    },
                    child: Image.asset("assets/icons/appleBranco.png", height: 30,)),
                ),

                if(projects.webLink!=null)
                InkWell(
                  
                  onTap: () {
                    js.context.callMethod("open",[projects.webLink]);
                  },
                  child: Image.asset("assets/icons/websiteBranco.png", height: 30,)),
                  
              ],
            ),
          )
    
    
        ],
      ),
    );
  }
}