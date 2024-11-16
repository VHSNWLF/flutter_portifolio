import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/size.dart';
import 'package:flutter_portifolio/constants/sns_links.dart';
import 'package:flutter_portifolio/widgets/custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child:    Column(
        children: [

          //title
          const Text("Get in touch", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CustomColor.whitePrimary,
          ),),

          const SizedBox(height: 50,),

          //Fields and button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              if(constraints.maxWidth >= kMinDesktopWidth){
                return buildNameEmailFieldDesktop();
              }
              return buildNameEmailFieldMobile();
            },)
          ),
          const SizedBox(height: 15,),

          //message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: const CustomTextField(hintText: "Your message", maxLines: 16,)),

          const SizedBox(height: 20,),

          //Send Button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary
                ),
                onPressed: () {
                
              }, child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Get in touch", style: TextStyle(
                  fontSize: 20,
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.bold
                ),),
              ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(color: CustomColor.whitePrimary,),
            ),
            //SND icon button links
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 15,
              children: [
  //GitHub
                InkWell(
                  onTap: () {
                    js.context.callMethod("open", [SnsLinks.github]);
                  },
                  child: Image.asset("assets/icons/github.png", width: 30,),),
  //LinkedIn
                InkWell(
                  onTap: () {
                    js.context.callMethod("open", [SnsLinks.linkedin]);
                  },
                  child: Image.asset("assets/icons/linkedin.png", width: 30,),),
  //Instagram
                InkWell(
                  onTap: () {
                    js.context.callMethod("open", [SnsLinks.instagram]);
                  },
                  child: Image.asset("assets/icons/instagram.png", width: 30,),)
              ],
            )
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop(){
    return const Row(
      children: [
        //name
        Flexible(
          child: CustomTextField(hintText: "Your name",),
        ),
        SizedBox(width: 15,),
        //email
        Flexible(
          child: CustomTextField(hintText: "Your email",),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile(){
    return const Column(
      children: [
        //name
        Flexible(
          child: CustomTextField(hintText: "Your name",),
        ),
        SizedBox(height: 15,),
        //email
        Flexible(
          child: CustomTextField(hintText: "Your email",),
        ),
      ],
    );
  }
}