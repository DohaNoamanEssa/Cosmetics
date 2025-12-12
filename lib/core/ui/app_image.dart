import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  final String imageURL;
  final double? height, width;
  final Color? color;
  final BoxFit fit;
  final double? bottomSpace;

  const AppImage({
    super.key,
    required this.imageURL,
    this.height,
    this.width,
    this.color, this.fit=BoxFit.scaleDown,
    this.bottomSpace,
  });

  @override
  Widget build(BuildContext context) {
return Padding(
  padding: EdgeInsets.only(bottom: bottomSpace ?? 0),
  child: Builder(builder: (context){
    if (imageURL.toLowerCase().endsWith("svg")) {
      return SvgPicture.asset(
        "assets/icons/$imageURL",
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (imageURL.startsWith("http")) {
      return Image.network(
        imageURL,
        color: color,
        height: height,
        width: width,
        fit: fit,
        // loadingBuilder: (context, child, loadingProgress) => Center(child: CircularProgressIndicator()),


      );
    }
    else if (imageURL.endsWith("json")) {
      return Lottie.asset(
        "assets/lotties/$imageURL",
        height: height,
        width: width,
        fit: fit,

      );
    }

    return Image.asset(
      "assets/images/$imageURL",
      color: color,
      height: height,
      width: width,
      fit: fit,

    );
  }),
);
  }
}
