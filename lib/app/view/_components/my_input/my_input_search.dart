import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MySearchInput extends StatelessWidget {
  const MySearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Buscar por proveedor',
          hintStyle: AppTextStyle.inputHintStyle,
          isDense: true,
          // isCollapsed: true,
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: Image.asset(
            'assets/icons/searchIcon.png',
            scale: 2,
          ),
        ),
      ),
    );
  }
}
