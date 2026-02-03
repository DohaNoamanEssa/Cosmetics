import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'components/item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List <CategoryModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get(
      "http://www.cosmatics.growfet.comZ/api/Categories",
    );

     list=CategoriesData.fromJson({"list":resp.data}).list;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13.r).copyWith(top: 24.h),
        child: Column(
          children: [
            AppSearch(),
            list==null?CircularProgressIndicator():
            ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 13.w,
                vertical: 30.h,
              ).copyWith(bottom: 50.h),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => _Item(model: list![index]),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Divider(color: Color(0xffB3B3C1).withValues(alpha: .5)),
              ),
              itemCount: list!.length,
            ),
            SizedBox(height: 31.h),
          ],
        ),
      ),
    );
  }
}


class CategoriesData {
  late final List<CategoryModel> list;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CategoryModel.fromJson(e)).toList();
  }
}

class CategoryModel {
  late final int id;
  late final String title;
  late final String imageUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
  }
}
