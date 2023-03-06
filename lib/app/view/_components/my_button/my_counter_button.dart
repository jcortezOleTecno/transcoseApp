import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyCounterButton extends StatefulWidget {
  const MyCounterButton({
    required this.decrease,
    required this.increase,
    Key? key,
  }) : super(key: key);

  final void Function(int) decrease;
  final void Function(int) increase;

  @override
  State<MyCounterButton> createState() => _MyCounterButtonState();
}

class _MyCounterButtonState extends State<MyCounterButton> {
  int units = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                if (units <= 1) return;
                setState(() {
                  units--;
                });
                widget.decrease(units);
              },
              child: Image.asset(
                'assets/icons/menos.png',
                color: AppColor.primaryBlue,
              ),
            ),
          ),
          Expanded(
              child: Center(
                  child: Text(
            '$units Unidad${units > 1 ? 'es' : ''}',
            style: AppTextStyle.defaultStyle,
          ))),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                setState(() {
                  units++;
                });
                widget.increase(units);
              },
              child: Image.asset(
                'assets/icons/mas.png',
                color: AppColor.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
