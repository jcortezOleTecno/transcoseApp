import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/about_us/about_us_page.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/menu/bloc/menu_cubit.dart';
import 'package:vemare/app/view/menu/bloc/menu_state.dart';
import 'package:vemare/app/view/personal_area/my_account/my_account_page.dart';
import 'package:vemare/app/view/my_services/services_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/my_contracts_page.dart';
import 'package:vemare/app/view/promotions/promotions_page.dart';
import 'package:vemare/app/view/shopping_cart/shopping_cart.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class MyMenu extends StatelessWidget {
  const MyMenu._({
    Key? key,
  }) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (context) => MenuCubit(
        getIt.get<LocalDataRepository>(),
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
            return Future.value(!state.isOpenMenu);
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
                      SvgPicture.asset(
                        'assets/icons/logo_splash.svg',
                        width: 120,
                      ),
                      const Spacer(),
                      _IconsAppbar(
                        state.isOpenMenu,
                        menuFunc: cubit.toggleMenu,
                      ),
                      spacerM,
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 90),
                  height: !state.isOpenMenu
                      ? 0
                      : MediaQuery.of(context).size.height -
                          (80 + MediaQuery.of(context).viewPadding.vertical),
                  child: const _Menu(),
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
  const _IconsAppbar(this.isOpenMenu, {required this.menuFunc, Key? key})
      : super(key: key);

  final bool isOpenMenu;
  final Function() menuFunc;

  @override
  State<_IconsAppbar> createState() => __IconsAppbarState();
}

class __IconsAppbarState extends State<_IconsAppbar> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();
    return Row(
      children: [
        spacerM,
        InkWell(
          onTap: () {},
          child: Image.asset(
            'assets/icons/notificationOn.png',
            color: Colors.white,
            scale: 2,
          ),
        ),
        spacerM,
        InkWell(
          onTap: () {
            if (ModalRoute.of(context)!.settings.name !=
                ShoppingCartPage.route) {
              Navigator.pushNamed(context, ShoppingCartPage.route);
            }
            if (cubit.state.isOpenMenu) {
              cubit.toggleMenu();
            }
          },
          child: Image.asset(
            'assets/icons/Bag.png',
            color: Colors.white,
            scale: 2,
          ),
        ),
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
    return Container(
      color: AppColor.primaryBlue,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<MenuCubit, MenuState>(
          builder: (ctx, state) {
            return Column(
              children: [
                state.isLogged
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
                  title: 'Promociones y Alquiler',
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
                  visible: state.isLogged,
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
                            title: 'Mi presupuestos',
                            onTap: () {},
                          ),
                          _MenuItem(
                            title: 'Mi pedidos',
                            onTap: () {},
                          ),
                          _MenuItem(
                            title: 'Mi formaciones y eventos',
                            onTap: () {},
                          ),
                          _MenuItem(
                            title: 'SAT',
                            onTap: () {},
                          ),
                          _MenuItem(
                            title: 'Modelo 347',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: state.isLogged,
                  child: Column(
                    children: [
                      divider,
                      ListTile(
                        onTap: () {
                          getIt.get<LocalDataRepository>().logOut().then((_) {
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
                _MenuItemExpand(
                  title:
                      state.isLogged ? 'Mis contactos Vemare' : 'Mis contactos',
                  icon: Image.asset(
                    'assets/icons/Phone.png',
                    scale: 2,
                    color: AppColor.white,
                  ),
                  children: [
                    _MenuItem(
                      onTap: () =>
                          _callDialog(context, number: '+34 999 9999 9999'),
                      title: 'comercial 1',
                      subtitle: '999 9999 9999',
                    ),
                    _MenuItem(
                      onTap: () =>
                          _callDialog(context, number: '+34 123 4567 8998'),
                      title: 'Comercial 2',
                      subtitle: '123 4567 8998',
                    ),
                  ],
                ),
                spacerL,
                ConfirmationSlider(
                  onConfirmation: () {},
                  backgroundColor: AppColor.blue,
                  foregroundColor: AppColor.blue200,
                  iconColor: AppColor.blue,
                  text: 'Hacer pedido telefónico',
                  sliderButtonContent: Image.asset(
                    'assets/icons/arrow_next.png',
                    scale: 2,
                  ),
                  width: MediaQuery.of(context).size.width * .85,
                  textStyle:
                      AppTextStyle.linkStyle.copyWith(color: AppColor.white),
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
          content: Text(number, style: AppTextStyle.h3Style),
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
    final state = context.read<MenuCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: AssetImage('assets/imgs/edificios.jpg'),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      color: AppColor.white,
                      child: Text('GERENTE',
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
