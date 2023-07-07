import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({
    required this.onSelectedDate,
    required this.onSelectedDateRegistered,
    Key? key,
    required this.dates,
  }) : super(key: key);

  final List<Horario> dates;
  final Function(Horario) onSelectedDate;
  final Function(Horario) onSelectedDateRegistered;

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
        firstDay: DateTime.now().subtract(const Duration(days: 60)),
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
        calendarStyle: CalendarStyle(
          todayTextStyle: const TextStyle(
              color: AppColor.primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: AppColor.primaryBlue, width: 2)),
          isTodayHighlighted: false,
          selectedDecoration: const BoxDecoration(
            color: AppColor.primaryBlue,
            shape: BoxShape.circle,
          ),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        selectedDayPredicate: (day) {
          if (widget.dates
              .where((e) => isSameDay(e.date, day))
              .toList()
              .isNotEmpty) {
            return isSameDay(_selectedDay, day);
          }
          return false;
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (widget.dates
              .where((e) => isSameDay(e.date, selectedDay))
              .toList()
              .isNotEmpty) {
            // setState(() {
            //   _selectedDay = selectedDay;
            //   _focusedDay = focusedDay;
            // });
            if (widget.dates
                .where((e) => isSameDay(e.date, selectedDay) && e.isRegistered!)
                .toList()
                .isNotEmpty) {
              widget.onSelectedDateRegistered(widget.dates.firstWhere(
                  (e) => isSameDay(e.date, selectedDay) && e.isRegistered!));
            }
            if (widget.dates
                .where(
                    (e) => isSameDay(e.date, selectedDay) && !e.isRegistered!)
                .toList()
                .isNotEmpty) {
              widget.onSelectedDate(widget.dates
                  .firstWhere((e) => isSameDay(e.date, selectedDay)));
            }
          }
        },
        calendarBuilders: _calendarBuilders(),
      ),
    );
  }

  CalendarBuilders<dynamic> _calendarBuilders() {
    return CalendarBuilders(
      defaultBuilder: (context, day, focusedDay) {
        if (widget.dates
            .where((e) => isSameDay(e.date, day) && e.isRegistered!)
            .toList()
            .isNotEmpty) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.success500,
                  border: Border.all(color: AppColor.success500, width: 2)),
              height: 40,
              width: 40,
              child: Text(
                day.day.toString(),
                style: AppTextStyle.linkStyle
                    .copyWith(fontSize: 15, color: Colors.white),
              ),
            ),
          );
        }
        if (widget.dates
            .where((e) => isSameDay(e.date, day) && e.centerReference!)
            .toList()
            .isNotEmpty) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: AppColor.success500, width: 2)),
              height: 40,
              width: 40,
              child: Text(
                day.day.toString(),
                style: AppTextStyle.linkStyle.copyWith(fontSize: 15),
              ),
            ),
          );
        }
        if (widget.dates
            .where((e) => isSameDay(e.date, day) && !e.centerReference!)
            .toList()
            .isNotEmpty) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: AppColor.red, width: 2)),
              height: 40,
              width: 40,
              child: Text(
                day.day.toString(),
                style: AppTextStyle.linkStyle
                    .copyWith(fontSize: 15, color: AppColor.red),
              ),
            ),
          );
        }
        if (isSameDay(DateTime.now(), day)) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: AppColor.primaryBlue, width: 2)),
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
    );
  }
}
