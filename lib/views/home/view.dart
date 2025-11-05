import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/pages/categories.dart';
import 'package:cosmetics/views/home/pages/home.dart';
import 'package:cosmetics/views/home/pages/my_cart.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  final list = [
    _Model("home.svg", HomePage(),),
    _Model("categories.svg", CategoriesPage(),),
    _Model("my_cart.svg", MyCartPage(),),
    _Model("profile.svg", ProfilePage(),),

  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex].page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: 13.w),
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 4.r,
              spreadRadius: 0,
              blurStyle: BlurStyle.normal,
              color: Color(0xff000000).withValues(alpha: .1),
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 6,
              spreadRadius: 0,
              blurStyle: BlurStyle.normal,
              color: Color(0xff000000).withValues(alpha: .1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: Color(0xffD9D9D9).withValues(alpha: .7),
          items: List.generate(
            list.length,
                (index) =>
                BottomNavigationBarItem(
                  icon: AppImage(imageURL: list[index].iconURL, color: currentIndex==index? Theme.of(context).primaryColor :null,),
                  label: "",
                ),
          ),
          onTap: (value) {
            currentIndex = value;
            setState(() {

            });
          },


          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xffD75D72),
          unselectedItemColor: Color(0xff8E8EA9),
        ),
      ),
    );
  }
}

class _Model {
  final String iconURL;
  final Widget page;

  _Model(this.iconURL, this.page);
}
