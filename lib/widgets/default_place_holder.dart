


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp/const/colors.dart';


class DefaultImageShowWidget extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  final String avatarUrl;

  const DefaultImageShowWidget({super.key, required this.width, required this.height, required this.avatarUrl, required this.radius});

  @override
  State<DefaultImageShowWidget> createState() => _DefaultImageShowWidgetState();
}
class _DefaultImageShowWidgetState extends State<DefaultImageShowWidget> {

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      placeholder: (context, url) =>
          Container(
            height:  widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                widget.radius,
              ),
              color: AppColor.alertGreenColor.withOpacity(0.5),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/image_placeholder.svg',
                width: widget.width,
              ),
            ),
          ),
      errorWidget: (context, url, error) =>
          Container(
            height:  widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                widget.radius,
              ),
              color: AppColor.alertGreenColor.withOpacity(0.5),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/image_placeholder.svg',
                width: widget.width,
              ),
            ),
          ),
      imageBuilder: (context, imageProvider) => Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            widget.radius,
          ),
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      imageUrl:widget.avatarUrl,
      width: widget.width,
      height: widget.height,
    );
  }

}
