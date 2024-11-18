import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/nav_items.dart';
import 'package:flutter_portifolio/widgets/site_logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap, required this.scrolled, required this.onLogoTap});
  final VoidCallback? onLogoTap;
  final Function(int) onNavMenuTap;
  final bool scrolled;

  @override
  // ignore: library_private_types_in_public_api
  _HeaderDesktopState createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  List<bool> isHoveredList = List.generate(navTitles.length, (_) => false); // Lista para rastrear o estado de hover

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: widget.scrolled ? const BoxDecoration(color: Colors.black54) : null,
      width: double.maxFinite,
      child: Row(
        children: [
          SiteLogo(onTap: widget.onLogoTap),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHoveredList[i] = true; // Muda o estado para 'hovered' quando o mouse entra
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHoveredList[i] = false; // Restaura o estado quando o mouse sai
                  });
                },
                child: TextButton(
                  onPressed: () {
                    widget.onNavMenuTap(i);
                  },
                  child: Text(
                    navTitles[i],
                    style: TextStyle(
                      color: isHoveredList[i] ? CustomColor.yellowSecondary : CustomColor.whitePrimary, // Altera a cor no hover
                      fontSize: 16,
                      fontFamily: "Krypton",
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
