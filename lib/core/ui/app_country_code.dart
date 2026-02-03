import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppCountryCode extends StatefulWidget {
  final ValueChanged<String>? onCountryCodeChanged;

  const AppCountryCode({super.key, required this.onCountryCodeChanged});

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late String selectedCountryCode;

  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<CountryModel> list;

  DataState state = DataState.loading;

  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});
    final resp = await DioHelper.getData('api/Countries');

    if (resp!.isSuccess) {
      list = (resp.data as List<dynamic>)
          .map((e) => CountryModel.fromJson(e))
          .toList();
      selectedCountryCode = list.first.code;
      state = DataState.success;
    } else {
      state = DataState.failed;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 6.0.w),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff5A6690).withValues(alpha: .4)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: state == DataState.failed
                ? IconButton(onPressed: getData, icon: Icon(Icons.replay))
                : state == DataState.loading
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
                  )
                : DropdownButton<String>(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                    value: selectedCountryCode,
                    items: list
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.code,
                            child: Text(
                              '${e.code} ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff434C6D),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      selectedCountryCode = value!;
                      widget.onCountryCodeChanged?.call(selectedCountryCode);
                      setState(() {});
                    },
                    icon: AppImage(
                      image: "arrow_down.svg",
                      color: Color(0xff767676),
                      width: 8.w,
                      height: 6.h,
                      fit: BoxFit.fill,
                    ),
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
          ),
        ),
        SizedBox(width: 6.w),
      ],
    );
  }
}

class CountryModel {
  late final int id;
  late final String code;
  late final String name;

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? "";
    name = json['name'] ?? "";
  }
}
