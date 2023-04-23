import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ButtonDownloadPdf extends StatefulWidget {
  const ButtonDownloadPdf({
    required this.future,
    Key? key,
  }) : super(key: key);

  final Future Function() future;

  @override
  State<ButtonDownloadPdf> createState() => _ButtonDownloadPdfState();
}

class _ButtonDownloadPdfState extends State<ButtonDownloadPdf> {
  bool _loading = false;

  Future<void> _executeFuture() async {
    setState(() {
      _loading = true;
    });
    await widget.future();
    setState(() {
      _loading = false;
    });
  }

  void _handleTap() {
    _executeFuture();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: _handleTap,
      label: _loading
          ? const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColor.primaryBlue,
              ))
          : const Icon(Icons.picture_as_pdf_outlined),
      icon: Text(
        'Descargar',
        style: AppTextStyle.linkStyle.copyWith(fontSize: 14),
      ),
    );
  }
}
