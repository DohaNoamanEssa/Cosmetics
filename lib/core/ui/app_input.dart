import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool isPassword, withCountryCode;
  final VoidCallback? onPressed;
  final String? suffixIcon;
  final String? hintText, labelText;
  final double? bottomSpace;
  final TextEditingController controller;

  const AppInput({
    super.key,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.onPressed,
    this.keyboardType,
    this.isPassword = false,
    this.bottomSpace = 16,
    this.withCountryCode = false,
    required this.controller,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
   bool isHidden=true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        children: [
          if (widget.withCountryCode == true) AppCountryCode(),

          Expanded(
            child: TextFormField(
              controller:widget.controller,
              maxLength: 10,
              inputFormatters: [

                if (widget.withCountryCode == true ) ...[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp(r'^1\d{0,9}$')),
                ],

                if(widget.withCountryCode==false)...[

                ]


              ],
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword && isHidden,
              decoration: InputDecoration(
                counterText: "",
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  color: Color(0xff8E8EA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                floatingLabelStyle: TextStyle(
                  color: Color(0xff8E8EA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Color(0xff8E8EA9),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff5A6690).withValues(alpha: .4),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff5A6690).withValues(alpha: .4),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),

                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: AppImage(
                          imageURL:isHidden
                              ? "visability_off.svg"
                              : "visability_on.svg",
                          width: 24.w,
                          height: 24.h,
                          bottomSpace: 0,
                        ),
                        onPressed: () {
                          isHidden = !isHidden;

                          setState(() {});
                        },
                      )
                    : widget.suffixIcon != null
                    ? AppImage(
                        imageURL: widget.suffixIcon!,
                        width: 18,
                        height: 18,
                      )
                    : null,

                suffixIconColor: Color(0xff8E8EA9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
