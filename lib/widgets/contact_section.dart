import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/size.dart';
import 'package:flutter_portifolio/constants/sns_links.dart';
import 'package:flutter_portifolio/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:js' as js;
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: Colors.black45,
      child:    Column(
        children: [
          //title
          Text("Get in touch", style: TextStyle(
            fontFamily: "Krypton",
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * .03,
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
            child:  CustomTextField(hintText: "Your message", maxLines: 16, controller: controller_message,)),

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
                onPressed: () async {
                  if(controller_email.text.trim() == "" || controller_name.text.trim() == "" || controller_message.text.trim() == ""){
                    toastification.show(
                      context: context,
                      style: ToastificationStyle.flatColored,
                      type: ToastificationType.error,
                      title: const Text("Nenhum campo pode estar vazio!"),
                      autoCloseDuration: const Duration(seconds: 3),
                    );
                  } else{
                    bool isOk = false;
                    String message = "<strong>Nome:</strong> ${controller_name.text}<br><strong>Email:</strong> ${controller_email.text}<br><strong>Mensagem:</strong> ${controller_message.text}"; 
                    isOk = await sendEmail(nameEmailAndText: message);
                    if(isOk){
                    toastification.show(
                      context: context,
                      style: ToastificationStyle.flatColored,
                      type: ToastificationType.success,
                      title: const Text("Email enviado com sucesso!"),
                      autoCloseDuration: const Duration(seconds: 3),
                    );
                  }else{
                    toastification.show(
                      context: context,
                      style: ToastificationStyle.flatColored,
                      type: ToastificationType.warning,
                      title: const Text("Erro ao enviar Email!"),
                      autoCloseDuration: const Duration(seconds: 3),
                    );
                  }
                }
              }, child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Get in touch", style: TextStyle(
                  fontFamily: "Krypton",
                  fontSize: 20,
                  color: Colors.black,
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
    return Row(
      children: [
        //name
        Flexible(
          child: CustomTextField(hintText: "Your name", controller: controller_name,),
        ),
        const SizedBox(width: 15,),
        //email
        Flexible(
          child: CustomTextField(hintText: "Your email", controller: controller_email,),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile(){
    return Column(
      children: [
        //name
        Flexible(
          child: CustomTextField(hintText: "Your name", controller: controller_name,),
        ),
        const SizedBox(height: 15,),
        //email
        Flexible(
          child: CustomTextField(hintText: "Your email", controller: controller_email,),
        ),
      ],
    );
  }

    TextEditingController controller_name = TextEditingController();
    TextEditingController controller_email = TextEditingController();
    TextEditingController controller_message = TextEditingController();

  
Future<bool> sendEmail({
  required String nameEmailAndText,
}) async {
  final url = Uri.parse('http://localhost:3000/send-email');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'html': nameEmailAndText,
  });

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print('Email enviado com sucesso!');
      return true;
    } else {
      print('Erro ao enviar email: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Erro na requisição: $e');
    return false;
  }
}
}