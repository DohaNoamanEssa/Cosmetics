import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({super.key});

  final list = [
    CartCategories(
      imgURL: "https://cdn1.ozone.ru/s3/multimedia-1-l/7584793473.jpg",
      categoryTitle: "Note Cosmetics",
      categorySubTitle: "Ultra rich mascara for lashes",
      categoryPrice: 350,
    ),
    CartCategories(
      imgURL:
          "https://productimages.hepsiburada.net/s/343/424-600/110000350476352.jpg",
      categoryTitle: "ARTDECO",
      categorySubTitle: "Bronzer - 02 ",
      categoryPrice: 490,
    ),
    CartCategories(
      imgURL:
          "https://i.pinimg.com/originals/93/a8/a1/93a8a110bb56b39c4661449108b9fd17.jpg",
      categoryTitle: "Fendi",
      categorySubTitle: "Lipstick - shade 9 ",
      categoryPrice: 260,
    ),
    CartCategories(
      imgURL:
          "https://i.pinimg.com/474x/61/00/d3/6100d31ee86ed020b101b2c77eb3a2d9.jpg",
      categoryTitle: "Channel",
      categorySubTitle: "L’eau de perfum N5 ",
      categoryPrice: 15.000,
    ),

  ];
  late final int numberOfProducts=list.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Title ----------------------------------------------------------------------------
      appBar: AppBar(
        title: Center(child: Text("My Cart", style: TextStyle(fontWeight: FontWeight.w700))),
        actions: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: IconButton(
                onPressed: (){
                  goTo(CheckOutView());
                },
                icon:AppImage(imageURL: "my_cart_final.svg",)),

          ),
        ],

      ),
      body: Padding(
        padding: EdgeInsets.only(left:16.w,right: 16.w,top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SubTitle-------------------------------------------------------------------------
            Text(
              "You have $numberOfProducts products in your cart",
              style: TextStyle(
                color: Color(0XFF434C6D).withValues(alpha: .55),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 34.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.w,
                  vertical: 34.h,
                ).copyWith(top: 12.h, bottom: 60.h),
                itemBuilder: (context, index) => Padding(
                  padding:  EdgeInsets.symmetric(vertical: 12.0.h),
                  child: _Item(cartCategory: list[index]),
                ),
                separatorBuilder: (context, index) => Divider(color: Color(0xffB3B3C1).withValues(alpha: .5),),
                itemCount: list.length,
              ),
            ),

            //Categories in cart
          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final CartCategories cartCategory;

  const _Item({ required this.cartCategory});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  var count=1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: Stack(
            children: [
              AppImage(
                imageURL: widget.cartCategory.imgURL,
                 fit: BoxFit.fill,
                height: 102.h,
                width: 102.w,
                bottomSpace: 0,
              ),
              Padding(
                padding:  EdgeInsets.all(6.0.r),
                child: AppImage(imageURL: "remove.svg"),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Color(0xff3B4569),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                  children: [
                    TextSpan(text:"${widget.cartCategory.categoryTitle}\n" ),
                    TextSpan(
                      text: "${widget.cartCategory.categorySubTitle}\n",
                      style: TextStyle(
                        color: Color(0xff3B4569).withValues(alpha: .73),
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    TextSpan(text: "${widget.cartCategory.categoryPrice.toString()} EGP"),
                  ],
                ),
              ),

              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Color(0xff8E8EA9), width: 1),

                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (count > 1) {
                            count--;
                          }
                          setState(() {});
                        },
                        icon: AppImage(
                          color: Color(0XFF434C6D),
                          imageURL: "minus.svg",
                          width: 20.w,
                          bottomSpace: 0,
                        ),
                      ),
                      Text(
                        "$count",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF434C6D),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          count++;
                          setState(() {});
                        },
                        icon: AppImage(
                          imageURL: "plus.svg",
                          width: 20.w,
                          color: Color(0xff434C6D),
                          bottomSpace: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CartCategories {
  final String imgURL;
  final String categoryTitle;
  final String categorySubTitle;
  final double categoryPrice;

  CartCategories({
    required this.imgURL,
    required this.categoryTitle,
    required this.categorySubTitle,
    required this.categoryPrice,
  });
}
