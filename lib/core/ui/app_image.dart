import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatefulWidget {
  final String image;
  final double? height, width;
  final isCircle;
  final Color? color;
  final BoxFit fit;
  final double? bottomSpace;
  final VoidCallback? onLottieClicked;

  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.isCircle = false,
    this.color,
    this.fit = BoxFit.scaleDown,
    this.bottomSpace, this.onLottieClicked,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage>
    with SingleTickerProviderStateMixin {
    AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.onLottieClicked != null) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final myFit = widget.isCircle ? BoxFit.cover : widget.fit;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 0),
      child: Builder(
        builder: (context) {
          Widget child;

          if (widget.image.isEmpty) {
            return SizedBox.shrink();
          }

          if (widget.image.toLowerCase().endsWith("svg")) {
            child = SvgPicture.asset(
              "assets/icons/${widget.image}",
              colorFilter: widget.color != null
                  ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
                  : null,
              height: widget.height,
              width: widget.width,
              fit: myFit,
            );
          } else if (widget.image.startsWith("http")) {
            child = Image.network(
              widget.image,
              color: widget.color,
              height: widget.height,
              width: widget.width,
              fit: myFit,

              // loadingBuilder: (context, child, loadingProgress) => Center(child: CircularProgressIndicator()),
            );
          } else if (widget.image.endsWith("json")) {
            child = Lottie.asset(
              "assets/lotties/${widget.image}",
              height: widget.height,
              width: widget.width,
              fit: myFit,
              controller: _controller,
            );


            if (widget.onLottieClicked != null) {
             child= GestureDetector(
                onTap: () {
                  if (_controller!.isCompleted) {
                    _controller!.reverse();
                  } else {
                    _controller!.forward();
                  }
                  widget.onLottieClicked?.call();

                },
                child:child,
              );
            }
          }
          else {
            child = Image.asset(
              "assets/images/${widget.image}",
              color: widget.color,
              height: widget.height,
              width: widget.width,
              fit: myFit,
            );
          }
          if (widget.isCircle) return ClipOval(child: child);

          return child;
        },
      ),
    );
  }
}
