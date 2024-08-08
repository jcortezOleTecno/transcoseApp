import 'package:flutter/material.dart';

class MyFilterImage extends StatelessWidget {
  const MyFilterImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * 0.2,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
