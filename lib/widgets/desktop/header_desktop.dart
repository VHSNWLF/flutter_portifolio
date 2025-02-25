import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/nav_items.dart';
import 'package:flutter_portifolio/provider/languageProvider.dart';
import 'package:flutter_portifolio/views/home_page.dart';
import 'package:flutter_portifolio/widgets/site_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop(
      {super.key,
      required this.onNavMenuTap,
      required this.scrolled,
      required this.onLogoTap});
  final VoidCallback? onLogoTap;
  final Function(int) onNavMenuTap;
  final bool scrolled;

  @override
  // ignore: library_private_types_in_public_api
  _HeaderDesktopState createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  List<bool> isHoveredList = List.generate(
      navTitles.length, (_) => false); // Lista para rastrear o estado de hover


  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context, listen: false);
    ScreenUtil.init(context);
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration:
          widget.scrolled ? const BoxDecoration(color: Colors.black54) : null,
      width: double.maxFinite,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SiteLogo(
              onTap: widget.onLogoTap,
              scale: 8.sp,
            ),
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHoveredList[i] =
                        true; // Muda o estado para 'hovered' quando o mouse entra
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHoveredList[i] =
                        false; // Restaura o estado quando o mouse sai
                  });
                },
                child: TextButton(
                  onPressed: () {
                    widget.onNavMenuTap(i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: language.selectedLanguage == "English - EUA" ? Text(
                      navTitles[i],
                      style: TextStyle(
                        color: isHoveredList[i]
                            ? CustomColor.yellowSecondary
                            : CustomColor.whitePrimary, // Altera a cor no hover
                        fontSize: 7.sp,
                        fontFamily: "Krypton",
                      ),
                    ) : Text(
                      navTitlesBR[i],
                      style: TextStyle(
                        color: isHoveredList[i]
                            ? CustomColor.yellowSecondary
                            : CustomColor.whitePrimary, // Altera a cor no hover
                        fontSize: 7.sp,
                        fontFamily: "Krypton",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          DropdownButton<String>(
            value: language.selectedLanguage,
            items: const [
              DropdownMenuItem<String>(
                value: "Português - BR",
                child: Text("Português - BR"),
              ),
              DropdownMenuItem<String>(
                value: "English - EUA",
                child: Text("English - EUA"),
              ),
            ],
            onChanged: (String? newValue) {
              if (newValue != null) {
                  language.changeLanguage(newValue);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage( ),));
                  setState(() {
                    
                  });
              }
            },
          )
        ],
      ),
    );
  }
}
