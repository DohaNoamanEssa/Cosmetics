import 'dart:async';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class PinLocationView extends StatefulWidget {
  const PinLocationView({super.key});

  @override
  State<PinLocationView> createState() => _PinLocationViewState();
}

class _PinLocationViewState extends State<PinLocationView> {
  Set<Marker> markers = {};

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("amr service enabled $serviceEnabled");
    if (!serviceEnabled) {
      showMsg("برجاء تفعيل خدمة الوصول للموقع");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    print("Amr permissions $permission");

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Amr permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    final pos = await Geolocator.getCurrentPosition();
    print("amr current pos $pos");

    markers.add(
      Marker(
        markerId: MarkerId("current position"),
        position: LatLng(pos.latitude, pos.longitude),
      ),
    );
    setState(() {});

    final controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(pos.latitude, pos.longitude), zoom: 16),
      ),
    );
    return pos;
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  final _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final position = LatLng(31.1436, 31.7954);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin Location"),
        leading: Padding(
          padding: EdgeInsetsGeometry.all(10.r),
          child: AppBack(),
        ),
      ),
      body: GoogleMap(
        markers: markers,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        onTap: (argument) {
          markers.add(Marker(markerId: MarkerId("loc"), position: argument));

          setState(() {});
        },

        initialCameraPosition: CameraPosition(target: position, zoom: 5),
      ),
    );
  }
}