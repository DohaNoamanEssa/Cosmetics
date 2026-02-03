part of '../view.dart';

class _List extends StatefulWidget {
  final String title;

  const _List({ required this.title});


  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {

  List<ProductModel>? list;

  Future<void> getData() async {
    final resp =await Dio().get("http://www.cosmatics.growfet.com/api/Products");

     list=ProductsData.fromJson({"list":resp.data}).list;
     setState(() {

     });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF434C6D),
          ),
        ),
        SizedBox(height: 14.h),
        (list==null)?Center(child: CircularProgressIndicator()):GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 176 / 237,
          ),
          itemBuilder: (context, index) => _Item(model: list![index]),
          itemCount: list!.length,
        ),
      ],
    );
  }
}

class ProductsData {
  late final List<ProductModel> list;

  ProductsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['list']??[]).map((e) => ProductModel.fromJson(e)).toList();
  }
}

class ProductModel {
  late final int id;
  late final String name;
  late final String description;
  late final num price;
  late final int stock;
  late final String imageUrl;
  late final Null categoryId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    description = json['description']??"";
    price = json['price']??0;
    stock = json['stock']??0;
    imageUrl = json['imageUrl']??"";
    categoryId = null;
  }
}
