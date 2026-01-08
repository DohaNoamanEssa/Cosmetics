import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/create_account.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoginOrRegister extends StatefulWidget {
  final bool isLogin;

  const AppLoginOrRegister({super.key, this.isLogin = true});

  @override
  State<AppLoginOrRegister> createState() => _AppLoginOrRegisterState();
}

class _AppLoginOrRegisterState extends State<AppLoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: widget.isLogin ? "Don’t have an account?" : "Have an account?",
              style: TextStyle(
                color: Color(0xff434C6D),
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                ),
                child: Text(
                  widget.isLogin ? "Register" : "Login",
                  style: TextStyle(
                    color: Color(0xffD75D72),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                onPressed: () {
                  // if (widget.isLogin) {
                  //   goTo(CreateAccountView());
                  //
                  //
                  // } else {
                  //   goTo(LoginView());
                  //
                  // }
                  widget.isLogin? goTo(CreateAccountView()): Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
