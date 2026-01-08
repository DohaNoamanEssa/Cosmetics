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
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;
  final String? Function(String?)? validator;

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
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          if (widget.withCountryCode == true)
            AppCountryCode(onCountryCodeChanged: widget.onCountryCodeChanged),

          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              maxLength: 10,
              inputFormatters: [
                if (widget.withCountryCode == true) ...[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp(r'^1\d{0,9}$')),
                ],

                if (widget.withCountryCode == false) ...[],
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
                    ? Padding(
                      padding:  EdgeInsets.all(12.r),
                      child: AppImage(
                          image: 'password_visibility.json',
                          bottomSpace: 0,
                          width: 20.w,
                          height: 20.h,
                                        fit: BoxFit.scaleDown,
                                        onLottieClicked: () {
                            isHidden = !isHidden;
                            setState(() {});
                          },
                        ),
                    )
                    : widget.suffixIcon != null
                    ? AppImage(image: widget.suffixIcon!, width: 18, height: 18)
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
