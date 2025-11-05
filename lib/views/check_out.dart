import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(13.0.r),
          child: InkWell(
            onTap: () {
              goTo(HomeView());
            },
            child: CircleAvatar(
              backgroundColor: Color(0xff101010).withValues(alpha: .05),
              child: AppImage(
                imageURL: "arrow_left.svg",
                width: 6.w,
                height: 14.h,
                color: Color(0xff101010),
              ),
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Checkout",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Color(0xff434C6D),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                    color: Color(0xff29D3DA).withValues(alpha: .11),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 35.w, left: 35.w),
                    //Blue column------------------------------------------------------------------------
                    child: Column(
                      children: [
                        //Text Delivery
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            left: 27.w,
                            bottom: 18.h,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Delivery to",
                              style: TextStyle(
                                color: Color(0xff434C6D),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        //Row------------Map------------------------------------------------------------
                        Container(
                          width: 309.w,
                          height: 84.h,
                          padding: EdgeInsets.all(10.0.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(color: Color(0xff73B9BB)),
                          ),
                          child: Row(
                            children: [
                              //MAP **********************************************************************
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.r),
                                child: SizedBox(
                                  height: 60.h,
                                  width: 97.w,
                                  child: GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: LatLng((31.1436), (31.7954)),
                                      zoom: 5,
                                    ),
                                    zoomControlsEnabled: false,
                                    gestureRecognizers:
                                        <Factory<OneSequenceGestureRecognizer>>{
                                          Factory<OneSequenceGestureRecognizer>(
                                            () => EagerGestureRecognizer(),
                                          ),
                                        },
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 17.h),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: Color(0xff434C6D),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Mansoura, 14 Porsaid St",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                      color: Color(0xff8E8EA9),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              AppImage(imageURL: "arrow_down.svg"),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                        //Payment
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Payment Method",
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h),

                        Container(
                          width: 309.w,
                          height: 54.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(color: Color(0xff73B9BB)),
                          ),
                          padding: EdgeInsets.all(10.r),
                          child: Row(
                            children: [
                              AppImage(
                                imageURL: "pay.svg",
                                width: 30.w,
                                height: 20.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "**** ***** **** 0256",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: Color(0xff434C6D),
                                ),
                              ),
                              Spacer(),
                              AppImage(imageURL: "arrow_down.svg"),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h),
                        //////////////////////////////////////////////////////////////////////////
                        Container(
                          width: 309.w,
                          height: 57.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            border: Border.all(color: Color(0xff73B9BB)),
                          ),
                          padding: EdgeInsets.all(10.r),
                          child: Row(
                            children: [
                              AppImage(
                                imageURL: "offer.svg",
                                width: 24.w,
                                height: 24.h,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "Add vaucher",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: Color(0xff434C6D),
                                ),
                              ),
                              Spacer(),

                              FilledButton(
                                onPressed: () {},

                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 31.5.h),

                        //################################################################################
                        // DashedLine(),
                        Text(
                          "--------------------------------------------------------------------------------------------------------------",
                          maxLines: 1,
                        ),

                        SizedBox(height: 31.5.h),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "- REVIEW PAYMENT",
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "PAYMENT SUMMARY",
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "Subtotal",
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "16.100 EGP",
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "SHIPPING FEES",
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "TO BE CALCULATED",
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Divider(color: Color(0xff73B9BB),),
                        Row(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "TOTAL + VAT",
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "16.100 EGP",
                                style: TextStyle(
                                  color: Color(0xff434C6D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 44),
                        AppButton(
                          buttonTitle: "Order",
                          isIcon: true,
                          prefixIcon: "order_check.svg",
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
