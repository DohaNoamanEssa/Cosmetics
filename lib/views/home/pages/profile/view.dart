import 'package:cosmetics/core/logic/cache_helper.dart';
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/ui/app_image.dart';

part 'components/header.dart';

part 'components/item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final resp = await DioHelper.getData("api/Auth/profile");
    if (resp!.isSuccess) {
      final model = UserModel.fromJson(resp.data);
      await CacheHelper.saveUserData(model: model);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              _Header(),
              Padding(
                padding: EdgeInsets.all(
                  13.0.r,
                ).copyWith(top: 40.h, bottom: 34.h),
                child: Column(
                  children: [
                    _Item(icon: "edit_info.svg", title: "Edit Info"),
                    _Item(icon: "order_history.svg", title: "Order History"),
                    _Item(icon: "wallet.svg", title: "Wallet"),
                    _Item(icon: "settings.svg", title: "Settings"),
                    _Item(icon: "offer.svg", title: "Voucher"),
                    _Item(
                      icon: "logout.svg",
                      title: "Logout",
                      destinationPage: LoginView(),
                      withSuffixIcon: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
