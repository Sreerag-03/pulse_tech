import 'package:flutter/material.dart';
import 'package:pulse_tech/utils/colors.dart';
import 'package:pulse_tech/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar( 
      actions: [

      ],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boldText(text: "Pulse", size: 20, color: AppColors.primary),
            modifiedText(text: "Text", size: 20, color: AppColors.lightwhite),
          ],
        ),
      ),
      centerTitle: true,
     );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}