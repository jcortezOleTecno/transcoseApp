import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({
    required this.onSelectedDate,
    Key? key,
    required this.dates,
  }) : super(key: key);

  final List<DateTime> dates;
  final Function(DateTime) onSelectedDate;

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        headerStyle: HeaderStyle(
          titleTextFormatter: (date, locale) =>
              DateFormat.yMMMM(locale).format(date).toUpperCase(),
          formatButtonShowsNext: false,
          titleCentered: true,
          titleTextStyle: AppTextStyle.h3Style,
          formatButtonVisible: false,
        ),
        locale: 'es_ES',
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: false,
          selectedDecoration: BoxDecoration(
            color: AppColor.primaryBlue,
            shape: BoxShape.circle,
          ),
        ),
        selectedDayPredicate: (day) {
          if (widget.dates
              .where((e) => isSameDay(e, day))
              .toList()
              .isNotEmpty) {
            return isSameDay(_selectedDay, day);
          }
          return false;
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (widget.dates
              .where((e) => isSameDay(e, selectedDay))
              .toList()
              .isNotEmpty) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            if (widget.dates
                .where((e) => isSameDay(e, selectedDay))
                .toList()
                .isNotEmpty) {
              widget.onSelectedDate(selectedDay);
            }
          }
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            if (widget.dates
                .where((e) => isSameDay(e, day))
                .toList()
                .isNotEmpty) {
              return Center(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: AppColor.primaryBlue)),
                  height: 40,
                  width: 40,
                  child: Text(
                    day.day.toString(),
                    style: AppTextStyle.linkStyle.copyWith(fontSize: 15),
                  ),
                ),
              );
            }
            return null;
          },
          dowBuilder: (context, day) {
            return Center(
              child: Text(
                DateFormat.E('es').format(day).toUpperCase(),
              ),
            );
          },
        ),
      ),
    );
  }
}
