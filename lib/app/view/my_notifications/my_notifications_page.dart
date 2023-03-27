import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/domain/value_object/notifications_type.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_notifications/bloc/notifications_cubit.dart';
import 'package:vemare/app/view/my_notifications/bloc/notifications_state.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import 'package:timeago/timeago.dart' as timeago;

class MyNotificationsPage extends StatelessWidget {
  const MyNotificationsPage._();
  static const route = '/my_notifications';

  static Widget create() => BlocProvider(
        create: (context) => NotificationsCubit(),
        child: const MyNotificationsPage._(),
      );

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    return Scaffold(
      body: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MyBody(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mis notificaciones',
                          style: AppTextStyle.h1Style,
                        ),
                        spacerM,
                        _SelectTypeNotifications(
                          onTap: (p0) => print(p0),
                        ),
                        spacerM,
                        ...List.generate(
                          cubit.state.notifications.length,
                          (i) => _MyNotificationCard(
                            onDismissed: () => cubit.deleteNotification(i),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SelectTypeNotifications extends StatefulWidget {
  _SelectTypeNotifications({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  void Function(NotificationType) onTap;

  @override
  State<_SelectTypeNotifications> createState() =>
      _SelectTypeNotificationsState();
}

class _SelectTypeNotificationsState extends State<_SelectTypeNotifications> {
  NotificationType typeSelected = NotificationType.general;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              _item('General', type: NotificationType.general),
              _item('Formaciones', type: NotificationType.formations),
              _item('Eventos', type: NotificationType.events),
            ],
          ),
          Row(
            children: [
              _item('Promociones', type: NotificationType.promotions),
              _item('Mi empresa', type: NotificationType.myBusiness),
              _item('SAT', type: NotificationType.sat),
            ],
          )
        ],
      ),
    );
  }

  Widget _item(String name, {required NotificationType type}) {
    return Expanded(
      child: Material(
        color: AppColor.white,
        child: InkWell(
          onTap: () {
            setState(() {
              typeSelected = type;
              widget.onTap(typeSelected);
            });
          },
          child: Column(
            children: [
              spacerXs,
              Text(
                name,
                style: AppTextStyle.inputStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: typeSelected == type
                      ? AppColor.primaryBlue
                      : AppColor.neutral20,
                ),
              ),
              spacerS,
              Divider(
                color: typeSelected == type
                    ? AppColor.primaryBlue
                    : AppColor.neutral05,
                thickness: 2.5,
                height: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MyNotificationCard extends StatelessWidget {
  const _MyNotificationCard({required this.onDismissed});
  final Function() onDismissed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned.fill(
            child: Dismissible(
              key: UniqueKey(),
              resizeDuration: const Duration(milliseconds: 100),
              direction: DismissDirection.endToStart,
              dismissThresholds: const {DismissDirection.endToStart: 0.3},
              dragStartBehavior: DragStartBehavior.down,
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  onDismissed();
                }
              },
              confirmDismiss: (direction) async {
                return (direction == DismissDirection.endToStart);
              },
              background: Container(
                padding: const EdgeInsets.only(right: 25),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white30),
                  child: Image.asset(
                    'assets/icons/Trash.png',
                    scale: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        // margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.blue100),
                        child: Image.asset(
                          'assets/icons/Notifications.png',
                          scale: 2,
                          color: AppColor.primaryBlue,
                        ),
                      ),
                      spacerS,
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              'Hay un nuevo curso en Lorem ipsum, que puede interesarte, que se corresponde con otras formaciones realizadas. ',
                              style: AppTextStyle.defaultStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                timeago.format(
                                    DateTime.now()
                                        .subtract(const Duration(hours: 9)),
                                    locale: 'es'),
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              Image.asset(
                                'assets/icons/arrow_next.png',
                                scale: 2,
                              )
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
