import 'package:flutter/material.dart';
import 'package:flutter_portifolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap, required this.scrolled});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  final bool scrolled;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: scrolled? const BoxDecoration(color: Colors.black54) : null,
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(onPressed: onMenuTap, icon:const Icon(Icons.menu)),
                )
              ],
            ),
          );
  }
}