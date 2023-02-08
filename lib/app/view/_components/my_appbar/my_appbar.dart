import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  bool isOpenMenu = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          isOpenMenu = false;
        });
        return Future.value(true);
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
                  _IconsAppbar(isOpenMenu, menuFunc: () {
                    if (isOpenMenu) {
                      setState(() {
                        isOpenMenu = false;
                      });
                    } else {
                      setState(
                        () {
                          isOpenMenu = true;
                          print('menu abierto');
                        },
                      );
                    }
                  }),
                  spacerM,
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: !isOpenMenu
                  ? 0
                  : MediaQuery.of(context).size.height -
                      (80 + MediaQuery.of(context).viewPadding.vertical),
              child: const _Menu(),
            )
          ],
        ),
      ),
    );
  }
}

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
          onTap: () {},
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
    return Container(
      // height: double.infinity,
      // width: double.infinity,
      color: AppColor.primaryBlue,
      child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const _HeaderMenu(),
              divider,
              _MenuItem(
                onTap: () {},
                title: 'Nuestros productos',
              ),
              _MenuItem(
                onTap: () {},
                title: 'Promociones y Alquiler',
              ),
              _MenuItem(
                onTap: () {},
                title: 'Servicios',
              ),
              _MenuItem(
                onTap: () {},
                title: 'Sobre nosotros',
              ),
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
                    onTap: () {},
                    title: 'Mi cuenta',
                  ),
                  _MenuItem(
                    onTap: () {},
                    title: 'Mis contactos',
                  ),
                  _MenuItem(
                    onTap: () {},
                    title: 'Mi presupuestos',
                  ),
                  _MenuItem(
                    onTap: () {},
                    title: 'Mi pedidos',
                  ),
                  _MenuItem(
                    onTap: () {},
                    title: 'Mi formaciones y eventos',
                  ),
                  _MenuItem(
                    onTap: () {},
                    title: 'SAT',
                  ),
                  _MenuItem(
                    onTap: () {},
                    title: 'Modelo 347',
                  ),
                ],
              ),
              divider,
              ListTile(
                onTap: () {},
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
              divider,
              _MenuItemExpand(
                title: 'Mis contactos Vemare',
                icon: Image.asset(
                  'assets/icons/Phone.png',
                  scale: 2,
                  color: AppColor.white,
                ),
                children: [
                  _MenuItem(
                    onTap: () {},
                    title: 'comercial 1',
                    subtitle: '999 9999 9999',
                  ),
                  _MenuItem(
                    onTap: () {},
                    title: 'Comercial 2',
                    subtitle: '999 9999 9999',
                  ),
                ],
              ),
            ],
          )),
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
                'Automotor Sta Eugenia S.L',
                style: AppTextStyle.menuStyle,
              ),
              spacerS,
              Row(
                children: [
                  Text(
                    'Jose Luis Pozo',
                    style: AppTextStyle.menuStyle
                        .copyWith(fontWeight: FontWeight.normal),
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
