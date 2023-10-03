import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';

class ErrorIconWidget extends StatelessWidget {
  const ErrorIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColor.error200),
      child: const Icon(
        Icons.warning_amber_rounded,
        size: 30,
        color: AppColor.error,
      ),
    );
  }
}
