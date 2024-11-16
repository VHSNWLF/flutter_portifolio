import 'package:flutter/material.dart';
import 'package:flutter_portifolio/styles/style.dart';
import 'package:flutter_portifolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 50,
            margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(onTap: onLogoTap,),
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