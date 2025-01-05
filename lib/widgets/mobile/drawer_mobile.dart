import 'package:flutter/material.dart';
import 'package:flutter_portifolio/constants/colors.dart';
import 'package:flutter_portifolio/constants/nav_items.dart';
import 'package:flutter_portifolio/widgets/site_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});

  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: Column(
        children: [

          // Cabeçalho do Drawer com o ícone de fechar
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          
          // Itens de navegação do Drawer
          Expanded(
            child: ListView.builder(
              itemCount: navIcons.length,
              itemBuilder: (context, i) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  titleTextStyle: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  onTap: () {
                    onNavItemTap(i);
                  },
                  leading: Icon(navIcons[i]),
                  title: Text(
                    navTitles[i],
                    style: const TextStyle(fontFamily: "Krypton", color: CustomColor.yellowSecondary),
                  ),
                );
              },
            ),
          ),
          

          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SiteLogo(scale: 20.sp),  // O logo vai ficar na parte inferior
              ),
            ),
          ),
        ],
      ),
    );
  }
}
