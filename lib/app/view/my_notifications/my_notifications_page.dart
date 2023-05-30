import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/notifications_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/notification.dart' as model;
import 'package:vemare/app/domain/value_object/notifications_type.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_notifications/bloc/notifications_cubit.dart';
import 'package:vemare/app/view/my_notifications/bloc/notifications_state.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/event_detail_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_event_page.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:vemare/config/service_locator.dart';

class MyNotificationsPage extends StatelessWidget {
  const MyNotificationsPage._({super.key});
  static const route = '/my_notifications';

  static Widget create() => BlocProvider(
        create: (context) => NotificationsCubit(
          getIt.get<NotificationsRepository>(),
        ),
        child: const MyNotificationsPage._(),
      );

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    return Scaffold(
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return MyBody(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mis notificaciones',
                          style: AppTextStyle.h1Style,
                        ),
                        spacerM,
                        _SelectTypeNotifications(
                          onTap: cubit.getNotificationsType,
                        ),
                        spacerM,
                        if (state.loading)
                          ...List.generate(
                              3,
                              (_) => const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: MyShimmer(
                                        margin: EdgeInsets.zero, height: 120),
                                  )),
                        if (!state.loading && state.notifications.isEmpty)
                          const NoExistWidget('notificaciones'),

                        if (!state.loading)
                          ...state.notifications.map(
                            (e) => _MyNotificationCard(
                              notification: e,
                              onDismissed: () =>
                                  cubit.deleteNotification(e.id!),
                            ),
                          )

                        // ...List.generate(
                        //   cubit.state.notifications.length,
                        //   (i) => _MyNotificationCard(
                        //     onDismissed: () => cubit.deleteNotification(i),
                        //   ),
                        // ),
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
              _item('Categoría', type: NotificationType.category),
              _item('Centros', type: NotificationType.center),
            ],
          ),
          Row(
            children: [
              _item('Biblioteca', type: NotificationType.library),
              _item('Píldoras', type: NotificationType.pills),
              _item('Eventos', type: NotificationType.events),
            ],
          ),
          Row(
            children: [
              _item('Promociones', type: NotificationType.promotions),
              _item('Formaciones', type: NotificationType.formations),
              _item('Eventos vemare', type: NotificationType.eventVemare),
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
  const _MyNotificationCard(
      {required this.onDismissed, required this.notification});
  final Function() onDismissed;
  final model.Notification notification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (notification.tipo) {
          case 'Event':
            print(notification.dataNotification);
            Navigator.pushNamed(context, OtherEventPage.route,
                arguments: Events.fromJson(notification.dataNotification));
            break;
          default:
        }
      },
      child: Padding(
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
                    decoration: const BoxDecoration(
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
                                notification.mensaje ?? '',
                                style: AppTextStyle.defaultStyle,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  notification.elapsedTime ?? '',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
