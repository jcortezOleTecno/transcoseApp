import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';

class DownloadPdfContracts extends StatefulWidget {
  const DownloadPdfContracts({
    required this.onPressed,
    this.title,
    super.key,
  });

  final Future<void> Function() onPressed;
  final String? title;

  @override
  State<DownloadPdfContracts> createState() => _DownloadPdfContractsState();
}

class _DownloadPdfContractsState extends State<DownloadPdfContracts> {
  bool _loading = false;
  Future<void> _executeFuture() async {
    setState(() {
      _loading = true;
    });
    await widget.onPressed();
    setState(() {
      _loading = false;
    });
  }

  void _handleTap() {
    _executeFuture();
  }

  @override
  Widget build(BuildContext context) {
    return MyIconButton(
      onPressed: _handleTap,
      text: widget.title ?? "Detalles del contrato",
      icon: _loading
          ? const SizedBox(
              height: 8,
              width: 8,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColor.primaryBlue,
              ))
          : const Icon(Icons.description_outlined),
      variant: MyButtonVariant.outlinedBold,
    );
  }
}

class DownloadPdfContractsTable extends StatefulWidget {
  const DownloadPdfContractsTable({
    required this.onPressed,
    super.key,
  });

  final Future<void> Function() onPressed;

  @override
  State<DownloadPdfContractsTable> createState() =>
      _DownloadPdfContractsTableState();
}

class _DownloadPdfContractsTableState extends State<DownloadPdfContractsTable> {
  bool _loading = false;
  Future<void> _executeFuture() async {
    setState(() {
      _loading = true;
    });
    await widget.onPressed();
    setState(() {
      _loading = false;
    });
  }

  void _handleTap() {
    _executeFuture();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _handleTap,
      // text: "Detalles del contrato",
      icon: _loading
          ? const SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColor.primaryBlue,
              ))
          : const Icon(Icons.file_download_outlined),
      // variant: MyButtonVariant.outlinedBold,
    );
  }
}
