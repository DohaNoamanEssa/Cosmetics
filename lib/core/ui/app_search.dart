import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: Color(0xff8E8EA9)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.r)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffB3B3C1),
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(
      color: Color(0xffB3B3C1),
    ),
    borderRadius: BorderRadius.circular(25.r),
    ),

        suffixIcon:AppImage(imageURL: "search.svg"),

        suffixIconColor: Color(0xff8E8EA9),

      ),
    );
      

  }
}
