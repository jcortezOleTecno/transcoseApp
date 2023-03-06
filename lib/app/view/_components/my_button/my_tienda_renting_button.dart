import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyTiendaRentingButton extends StatefulWidget {
  const MyTiendaRentingButton({
    required this.isTienda,
    Key? key,
  }) : super(key: key);

  final void Function(bool) isTienda;

  @override
  State<MyTiendaRentingButton> createState() => _MyTiendaRentingButtonState();
}

class _MyTiendaRentingButtonState extends State<MyTiendaRentingButton> {
  bool isTienda = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.neutral40),
        ),
        child: Row(children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isTienda = true;
                });
                widget.isTienda(isTienda);
              },
              child: Container(
                color: isTienda ? AppColor.primary : null,
                alignment: Alignment.center,
                child: Text(
                  'Tienda',
                  style: AppTextStyle.buttonTextStyle.copyWith(
                    color: isTienda ? AppColor.white : AppColor.neutral40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isTienda = false;
                });
                widget.isTienda(isTienda);
              },
              child: Container(
                color: !isTienda ? AppColor.primary : null,
                alignment: Alignment.center,
                child: Text(
                  'Renting',
                  style: AppTextStyle.buttonTextStyle.copyWith(
                    color: !isTienda ? AppColor.white : AppColor.neutral40,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
