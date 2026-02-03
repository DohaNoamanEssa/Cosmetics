part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers();

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OfferModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get(
      'http://www.cosmatics.growfet.com/api/Sliders',
    );

    list = OffersData
        .fromJson({"list": resp.data})
        .list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return Center(child: CircularProgressIndicator());
    }
    return CarouselSlider(
      items: List.generate(
        list!.length,
            (index) =>
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AppImage(
                    image: list![index].imageUrl,
                    height: 320.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 364.w,
                    padding: EdgeInsets.all(16.r),
                    color: Color(0XFFE9DCD3).withValues(alpha: .8),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${list![index]
                                    .discountPercent} % OFF DISCOUNT\nCUPON CODE : ${list![index]
                                    .coupon}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF62322D),
                                ),
                              ),
                            ),
                            AppImage(image: "discount.svg"),
                          ],
                        ),
                        Row(
                          children: [
                            AppImage(image: "discount.svg"),
                            Spacer(),
                            Text(
                              "${list![index].descriptionTitle1}\n${list![index]
                                  .descriptionTitle2} ",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF434C6D),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
      options: CarouselOptions(
        height: 320.h,
        aspectRatio: 364.w / 320.h,
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}

class OffersData {
 late List<OfferModel> list;

  OffersData.fromJson(Map<String, dynamic> json) {
    list = List
        .from(json["list"] ?? [])
        .map((e) => OfferModel.fromJson(e))
        .toList();
  }
}

class OfferModel {
  late final String coupon, descriptionTitle1, descriptionTitle2, imageUrl;
  late final int id;
  late final num discountPercent;

  OfferModel.fromJson(Map<String, dynamic> json) {
    descriptionTitle1 = json["descriptionTitle1"] ?? "";
    descriptionTitle2 = json["descriptionTitle2"] ?? "";
    imageUrl = json["imageUrl"] ?? "";
    id = json["id"] ?? 0;
    coupon = json["couponCode"] ?? "";
    discountPercent = json["discountPercent"] ?? 0;
  }
}
