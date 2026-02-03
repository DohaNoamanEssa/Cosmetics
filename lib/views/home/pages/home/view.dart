import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

part 'components/offers.dart';

part 'components/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSearch(),

              SizedBox(height: 13.h),

              _Offers(),
              SizedBox(height: 24.h),
              _List(title: "Top rated products",),
              SizedBox(height: 24.h),
              _List(title: "Most ordered Products",),

            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final ProductModel model;

  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(8.0.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0,
                blurStyle: BlurStyle.inner,
                color: Colors.black.withValues(alpha: .25),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AppImage(
                    image: model.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 11.h),
              if(model.description.isNotEmpty)
              Padding(
                padding:  EdgeInsets.only(bottom: 11.h),
                child: Text(
                  model.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434C6D),
                  ),
                ),
              ),
              Text(
                "\$ ${model.price}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff70839C),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.0.r),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: AppImage(image: "check_out.svg"),
          ),
        ),
      ],
    );
  }
}
