import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/notifications_repository.dart';
import 'package:vemare/app/domain/model/vemare_contacts.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/about_us/about_us_page.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/menu/bloc/menu_cubit.dart';
import 'package:vemare/app/view/menu/bloc/menu_state.dart';
import 'package:vemare/app/view/my_notifications/my_notifications_page.dart';
import 'package:vemare/app/view/personal_area/SAT/page/my_sat_page.dart';
import 'package:vemare/app/view/personal_area/modelo_347/modelo_347_page.dart';
import 'package:vemare/app/view/personal_area/my_account/my_account_page.dart';
import 'package:vemare/app/view/my_services/services/services_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle/type_of_vehicle_page.dart';
import 'package:vemare/app/view/personal_area/my_budget/my_budget/my_budget_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/my_contracts_page.dart';
import 'package:vemare/app/view/personal_area/my_orders/my_orders_page.dart';
import 'package:vemare/app/view/personal_area/my_trainigs_and_events/my_trainigs_and_events_page.dart';
import 'package:vemare/app/view/promotions/promotions_categories/promotions_page.dart';
import 'package:vemare/app/view/shared/notifications_counter_bloc/notifications_cubit.dart';
import 'package:vemare/app/view/shared/notifications_counter_bloc/notifications_state.dart';
import 'package:vemare/app/view/shared/shopping_car_counter_bloc/car_counter_cubit.dart';
import 'package:vemare/app/view/shared/shopping_car_counter_bloc/car_counter_state.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/shopping_cart/shopping_cart.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../data/shopping_cart_repository.dart';
import '../home/bloc/home_cubit.dart';
import '../shared/userbloc/user_state.dart';

class MyMenu extends StatelessWidget {
  const MyMenu._({
    Key? key,
  }) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (context) => MenuCubit(
        getIt.get<NotificationsRepository>(),
      ),
      child: const MyMenu._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            if (state.isOpenMenu) {
              cubit.toggleMenu();
            }
            if (state.isOpenNotification) {
              cubit.toggleNotification();
            }
            return Future.value(!state.isOpenMenu && !state.isOpenNotification);
          },
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 80,
                  color: AppColor.blue,
                  child: Row(
                    children: [
                      spacerM,
                      GestureDetector(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.route, (route) => false),
                        // onTap: () => Navigator.popUntil(
                        //     context, ModalRoute.withName(HomePage.route)),
                        child: SvgPicture.asset(
                          'assets/icons/logo_splash.svg',
                          width: 120,
                        ),
                      ),
                      const Spacer(),
                      _IconsAppbar(
                        state.isOpenMenu,
                        state.isOpenNotification,
                        menuFunc: cubit.toggleMenu,
                        notificationsFunc: cubit.toggleNotification,
                      ),
                      spacerM,
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration:
                      Duration(milliseconds: state.isOpenNotification ? 0 : 60),
                  height: !state.isOpenMenu
                      ? 0
                      : MediaQuery.of(context).size.height -
                          (80 + MediaQuery.of(context).viewPadding.vertical),
                  child: const _Menu(),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: state.isOpenMenu ? 0 : 60),
                  height: !state.isOpenNotification ? 0 : null,
                  child: const _NotificationsMenu(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

/*
 
*/

class _IconsAppbar extends StatefulWidget {
  const _IconsAppbar(
    this.isOpenMenu,
    this.isOpenNotifications, {
    required this.menuFunc,
    required this.notificationsFunc,
    Key? key,
  }) : super(key: key);

  final bool isOpenMenu;
  final bool isOpenNotifications;
  final Function() menuFunc;
  final Function() notificationsFunc;

  @override
  State<_IconsAppbar> createState() => __IconsAppbarState();
}

class __IconsAppbarState extends State<_IconsAppbar> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();
    return Row(
      children: [
        if (LocalDataRepository().isLogged) ...[
          spacerM,
          BlocBuilder<NotificationsCounterCubit, NotificationsCounterState>(
            // bloc: NotificationsCounterCubit(getIt<NotificationsRepository>()),
            builder: (context, state) {
              return InkWell(
                onTap: widget.notificationsFunc,
                child: Visibility(
                  visible: !widget.isOpenNotifications,
                  replacement: Image.asset(
                    'assets/icons/Close.png',
                    color: Colors.white,
                    scale: 2,
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset(
                          'assets/icons/Notifications.png',
                          color: Colors.white,
                          scale: 2,
                        ),
                      ),
                      if (state.notifications != 0)
                        Positioned(
                          top: -3,
                          right: 0,
                          child: Text(
                            state.notifications.toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                    ],
                  ),
                  /*Image.asset(
                    'assets/icons/notificationOn.png',
                    color: Colors.white,
                    scale: 2,
                  ),*/
                ),
              );
            },
          ),
          spacerM,
          BlocBuilder<CarCounterCubit, CarCounterState>(
            // bloc: CarCounterCubit(getIt<ShoppingCardRepository>()),
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  if (ModalRoute.of(context)!.settings.name !=
                      ShoppingCartPage.route) {
                    Navigator.pushNamed(context, ShoppingCartPage.route);
                  }
                  if (cubit.state.isOpenMenu) {
                    cubit.toggleMenu();
                  }
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset(
                        'assets/icons/Bag.png',
                        color: Colors.white,
                        scale: 2,
                      ),
                    ),
                    if (state.products != 0)
                      Positioned(
                        top: -3,
                        right: 0,
                        child: Text(
                          state.products.toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ],
        spacerM,
        InkWell(
          onTap: widget.menuFunc,
          child: Visibility(
            visible: !widget.isOpenMenu,
            replacement: Image.asset(
              'assets/icons/Close.png',
              color: Colors.white,
              scale: 2,
            ),
            child: Image.asset(
              'assets/icons/Menu.png',
              color: Colors.white,
              scale: 2,
            ),
          ),
        ),
      ],
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();
    // final permissions = LocalDataRepository().user?.permissions;
    return Container(
      color: AppColor.primaryBlue,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<MenuCubit, MenuState>(
          builder: (ctx, state) {
            return Column(
              children: [
                LocalDataRepository().isLogged
                    ? const _HeaderMenu()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: MyButton(
                          width: double.infinity,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                ctx, LoginPage.route, (route) => false);
                          },
                          text: 'Iniciar Sesión',
                          variant: MyButtonVariant.outlinedBold,
                        ),
                      ),
                divider,
                _MenuItem(
                  title: 'Nuestros productos',
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name !=
                        TypeOfVehiclePage.route) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        TypeOfVehiclePage.route,
                        ModalRoute.withName(HomePage.route),
                      );
                    }
                    cubit.toggleMenu();
                  },
                ),
                _MenuItem(
                  title: 'Promociones',
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name !=
                        PromotionsPage.route) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        PromotionsPage.route,
                        ModalRoute.withName(HomePage.route),
                      );
                    }
                    cubit.toggleMenu();
                  },
                ),
                _MenuItem(
                  title: 'Servicios',
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name !=
                        ServicesPage.route) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        ServicesPage.route,
                        ModalRoute.withName(HomePage.route),
                      );
                    }
                    cubit.toggleMenu();
                  },
                ),
                _MenuItem(
                  title: 'Sobre nosotros',
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name !=
                        AboutUsPage.route) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AboutUsPage.route,
                        ModalRoute.withName(HomePage.route),
                      );
                    }
                    cubit.toggleMenu();
                  },
                ),
                Visibility(
                  visible: LocalDataRepository().isLogged,
                  child: Column(
                    children: [
                      divider,
                      _MenuItemExpand(
                        title: 'Mi área personal',
                        icon: Image.asset(
                          'assets/icons/user.png',
                          scale: 2,
                          color: AppColor.white,
                        ),
                        children: [
                          _MenuItem(
                            title: 'Mi cuenta',
                            onTap: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  MyAccountPage.route) {
                                Navigator.pushNamed(
                                    context, MyAccountPage.route);
                              }
                              if (cubit.state.isOpenMenu) {
                                cubit.toggleMenu();
                              }
                            },
                          ),
                          _MenuItem(
                            title: 'Mis contratos',
                            onTap: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  MyContractsPage.route) {
                                Navigator.pushNamed(
                                    context, MyContractsPage.route);
                              }
                              if (cubit.state.isOpenMenu) {
                                cubit.toggleMenu();
                              }
                            },
                          ),
                          _MenuItem(
                            title: 'Mis presupuestos',
                            onTap: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  MyBudgetPage.route) {
                                Navigator.pushNamed(
                                    context, MyBudgetPage.route);
                              }
                              if (cubit.state.isOpenMenu) {
                                cubit.toggleMenu();
                              }
                            },
                          ),
                          _MenuItem(
                            title: 'Mis pedidos',
                            onTap: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  MyOrdersPage.route) {
                                Navigator.pushNamed(
                                    context, MyOrdersPage.route);
                              }
                              if (cubit.state.isOpenMenu) {
                                cubit.toggleMenu();
                              }
                            },
                          ),
                          _MenuItem(
                            title: 'Mis formaciones y eventos',
                            onTap: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  MyTrainingAndEventsPage.route) {
                                Navigator.pushNamed(
                                    context, MyTrainingAndEventsPage.route);
                              }
                              if (cubit.state.isOpenMenu) {
                                cubit.toggleMenu();
                              }
                            },
                          ),
                          _MenuItem(
                            title: 'SAT',
                            onTap: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  MySatPage.route) {
                                Navigator.pushNamed(context, MySatPage.route);
                              }
                              if (cubit.state.isOpenMenu) {
                                cubit.toggleMenu();
                              }
                            },
                          ),
                          _MenuItem(
                            title: 'Modelo 347',
                            onTap: () {
                              if (ModalRoute.of(context)!.settings.name !=
                                  Modelo347Page.route) {
                                Navigator.pushNamed(
                                    context, Modelo347Page.route);
                              }
                              if (cubit.state.isOpenMenu) {
                                cubit.toggleMenu();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: LocalDataRepository().isLogged,
                  child: Column(
                    children: [
                      divider,
                      ListTile(
                        onTap: () {
                          context.read<UserCubit>().deleteUser();
                          LocalDataRepository().logOut().then((_) {
                            Navigator.pushNamedAndRemoveUntil(
                                ctx, LoginPage.route, (route) => false);
                          });
                        },
                        title: const Text(
                          'Cerrar sesión',
                          style: AppTextStyle.menuStyle,
                        ),
                        trailing: Image.asset(
                          'assets/icons/Logout.png',
                          color: Colors.white,
                          scale: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                divider,
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state.contacts == null) {
                      return const SizedBox();
                    }
                    return _MenuItemExpand(
                        title: 'Mis contactos Vemare',
                        icon: Image.asset(
                          'assets/icons/Phone.png',
                          scale: 2,
                          color: AppColor.white,
                        ),
                        children: state.contacts!.comerciales!.isEmpty
                            ? [
                                _MenuItem(
                                  onTap: () => _callDialog(context,
                                      number: contacDefault ?? ''),
                                  title: 'Teléfono de contacto',
                                  subtitle: contacDefault,
                                )
                              ]
                            : state.contacts!.comerciales!.map((e) {
                                if (e.phone == null || e.phone == '') {
                                  return const SizedBox();
                                }

                                return _MenuItem(
                                  onTap: () => _callDialog(context,
                                      number: e.phone == ''
                                          ? '000000000'
                                          : e.phone ?? '000000000'),
                                  title: e.name ?? '',
                                  subtitle: e.phone == ''
                                      ? '000 000 000'
                                      : '${e.phone?.split('').getRange(0, 3).join()}  ${e.phone?.split('').getRange(3, 6).join()}  ${e.phone?.split('').getRange(6, 9).join()}',
                                );
                              }).toList());
                  },
                ),
                spacerL,
                if (LocalDataRepository().isLogged)
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      return ConfirmationSlider(
                        onConfirmation: () async {
                          await launchUrlString(
                              'tel:${state.contacts?.centroReparto?.phone ?? '000000000'}');
                        },
                        backgroundColor: AppColor.blue,
                        foregroundColor: AppColor.blue200,
                        iconColor: AppColor.blue,
                        text: 'Hacer pedido telefónico',
                        sliderButtonContent: Image.asset(
                          'assets/icons/arrow_next.png',
                          scale: 2,
                        ),
                        width: MediaQuery.of(context).size.width * .85,
                        textStyle: AppTextStyle.linkStyle
                            .copyWith(color: AppColor.white),
                      );
                    },
                  ),
                spacerL,
              ],
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> _callDialog(BuildContext context, {required String number}) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(
            number,
            // '${number.split('').getRange(0, 3).join()} ${number.split('').getRange(3, 6).join()} ${number.split('').getRange(6, 9).join()}',
            style: AppTextStyle.h3Style,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await launchUrlString('tel:$number');
              },
              child: const Text('Llamar'),
            ),
          ],
        );
      },
    );
  }
}

class _MenuItemExpand extends StatelessWidget {
  const _MenuItemExpand({
    required this.title,
    required this.icon,
    this.children = const <Widget>[],
    Key? key,
  }) : super(key: key);
  final String title;
  final List<Widget> children;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: AppTextStyle.menuStyle,
      ),
      iconColor: AppColor.white,
      collapsedIconColor: AppColor.white,
      leading: icon,
      children: children,
    );
  }
}

class _HeaderMenu extends StatelessWidget {
  const _HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 60,
                width: 60,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: state.user?.logo == null
                    ? Image.asset('assets/imgs/profile_default.png')
                    : Image.network(
                        state.user!.logo!,
                        fit: BoxFit.cover,
                      ),
              ),
              spacerM,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    state.user?.name ?? '',
                    style: AppTextStyle.menuStyle,
                  ),
                  spacerS,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${state.user?.responsibleName ?? ''} ${state.user?.responsibleLastname ?? ''}',
                          style: AppTextStyle.menuStyle
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                      spacerS,
                      if (LocalDataRepository().user?.role != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            color: AppColor.white,
                            child: Text(
                                LocalDataRepository()
                                        .user
                                        ?.role
                                        ?.name
                                        ?.toUpperCase() ??
                                    '',
                                style: AppTextStyle.menuStyle
                                    .copyWith(color: AppColor.primaryBlue)),
                          ),
                        )
                    ],
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.onTap,
    required this.title,
    this.subtitle,
    Key? key,
  }) : super(key: key);
  final Function() onTap;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyle.menuStyle,
      ),
      subtitle: subtitle == null
          ? null
          : Text(subtitle ?? '',
              style: AppTextStyle.menuStyle.copyWith(
                fontSize: 18,
              )),
      trailing: Image.asset(
        'assets/icons/arrow_next.png',
        color: Colors.white,
        scale: 2,
      ),
    );
  }
}

class _NotificationsMenu extends StatelessWidget {
  const _NotificationsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      color: AppColor.primaryBlue,
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.notifications.where((e) => e.delete == 0).isNotEmpty)
                ...state.notifications
                    .where((e) => e.delete == 0)
                    .map((e) => Column(
                          children: [
                            const Divider(color: Colors.white),
                            ListTile(
                              leading: Stack(
                                children: [
                                  Image.asset('assets/icons/Notifications.png',
                                      scale: 2),
                                  if (e.read != 'visto')
                                    Positioned(
                                        right: 3,
                                        top: 3,
                                        child: Container(
                                          height: 6.5,
                                          width: 6.5,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                        ))
                                ],
                              ),
                              title: Text(e.mensaje ?? '',
                                  style: AppTextStyle.inputStyle
                                      .copyWith(color: Colors.white)),
                              subtitle: Text(
                                timeago.format(DateTime(2023, 5, 8),
                                    locale: 'es'),
                                style: AppTextStyle.inputStyle.copyWith(
                                  color: Colors.white,
                                  height: 2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              Visibility(
                visible: LocalDataRepository().isLogged,
                child: SizedBox(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                        onPressed: () {
                          if (ModalRoute.of(context)!.settings.name !=
                              MyNotificationsPage.route) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              MyNotificationsPage.route,
                              ModalRoute.withName(HomePage.route),
                            );
                          }
                          cubit.toggleNotification();
                        },
                        label: Image.asset(
                          'assets/icons/arrow_next.png',
                          scale: 2,
                          color: Colors.white,
                        ),
                        icon: Text(
                          'Ver mis notificaciones ',
                          style: AppTextStyle.inputStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
