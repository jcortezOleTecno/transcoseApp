import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';

class MyCustomDropdownMulti extends StatelessWidget {
  const MyCustomDropdownMulti({
    Key? key,
    required this.employees,
    required this.selectedEmployees,
    this.dropdownItems,
    this.dropdownWidth,
    this.onChanged,
  }) : super(key: key);

  final List<String> employees;
  final List<String> selectedEmployees;
  final double? dropdownWidth;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? dropdownItems;

  @override
  Widget build(BuildContext context) {
    return MyCustomDropdownButton(
      buttonWidth: double.infinity,
      dropdownWidth: dropdownWidth,
      hint: 'Selecciona uno o varios',
      dropdownItems: dropdownItems,
      value: selectedEmployees.isEmpty ? null : selectedEmployees.last,
      onChanged: (value) {},
      selectedItemBuilder: (context) {
        return employees.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                selectedEmployees.join(', '),
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            );
          },
        ).toList();
      },
    );
  }
}
