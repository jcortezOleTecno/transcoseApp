// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class StringRadioButtons extends StatefulWidget {
  const StringRadioButtons({
    super.key,
    required this.options,
    required this.onSelectionChanged,
    this.reset = false,
  });
  final List<String> options;
  final Function(String) onSelectionChanged;
  final bool reset;

  @override
  _StringRadioButtonsState createState() => _StringRadioButtonsState();
}

class _StringRadioButtonsState extends State<StringRadioButtons> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    if (widget.reset && _selectedOption != null) {
      setState(() {
        _selectedOption = null;
      });
    }
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: widget.options.map((option) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * .40,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<String>(
                value: option,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                  widget.onSelectionChanged(value!);
                },
              ),
              Expanded(child: Text(option)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
