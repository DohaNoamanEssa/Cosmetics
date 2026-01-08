import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  runApp(CosmaticsApp());
}

class CosmaticsApp extends StatelessWidget {
  const CosmaticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390.0, 844.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                disabledBackgroundColor: Colors.yellowAccent,
                backgroundColor:Color(0xffD75D72),
              ),

            ),
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Color(0xff434C6D)),
              displayMedium: TextStyle(color: Color(0xff434C6D)),
              displayLarge: TextStyle(color: Color(0xff434C6D)),
              displaySmall: TextStyle(color: Color(0xff434C6D)),
            ),
            fontFamily: "Montserrat",
            cardColor: Theme.of(context).cardColor,

            appBarTheme:  AppBarTheme(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                color: Color(0xff434C6D),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffB3B3C1)),
                borderRadius: BorderRadius.circular(25.r),
              ),
              hintStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff8E8EA9),
              ),
              labelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff8E8EA9),
              ),
              floatingLabelStyle: TextStyle(
                fontSize: 14.sp,
                color: Color(0xff8E8EA9),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff5A6690).withValues(alpha: .4),
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFFDA498C)),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xffD9D9D9),
          ),

          home: LoginView(),
        );
      },
    );
  }
}