import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
final  String buttonTitle;
final    Color? buttonColor;
final VoidCallback? onPressed;
final  String prefixIcon;
final bool isIcon;
   const AppButton( {super.key, required this.buttonTitle, this.buttonColor, this.onPressed ,   this.prefixIcon="",  this.isIcon=false}) ;

  @override
  Widget build(BuildContext context) {

    return
      (buttonTitle=="Order")?

      FilledButton(

        style: FilledButton.styleFrom(
          backgroundColor: buttonColor ?? Color(0xFFD75D72),
          minimumSize: Size(268, 65),

        ),
        onPressed:onPressed ?? (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isIcon)
              AppImage(imageURL: prefixIcon,),

            Row(
              children: [
                SizedBox(width: 3,),
                Text(
                  buttonTitle,
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      )


    :FilledButton(

      style: FilledButton.styleFrom(
        backgroundColor: buttonColor ?? Color(0xFFD75D72),
        minimumSize: Size(268, 65),

      ),
      onPressed:onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16,fontWeight: FontWeight.w600),
      ),
    );


  }
}
