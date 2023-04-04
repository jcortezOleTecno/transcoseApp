import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    this.height,
    this.borderRadius,
    this.margin,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;

  const MyShimmer.full({
    super.key,
    this.height = double.infinity,
    this.borderRadius = 0,
    this.margin = EdgeInsets.zero,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[350]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          color: Colors.white,
        ),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: height ?? 100,
      ),
    );
  }
}
