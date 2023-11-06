// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/utils/image_util.dart';
import 'package:vemare/app/domain/utils/validators.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_cubit.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_state.dart';
import 'package:vemare/app/view/shared/userbloc/user_state.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../../shared/userbloc/user_cubit.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage._();
  static const route = '/my_account';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyAccountCubit(
        getIt.get<AuthRepository>(),
      ),
      child: const MyAccountPage._(),
    );
  }

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController tcName;
  late TextEditingController tcPhone;
  late TextEditingController tcEmail;
  late TextEditingController tcCIF;
  late TextEditingController tcCode;
  late TextEditingController tcAddress;
  late TextEditingController tcCity;
  late TextEditingController tcProvince;
  late TextEditingController tcPostalCode;

  @override
  void initState() {
    tcName = TextEditingController();
    tcPhone = TextEditingController();
    tcEmail = TextEditingController();
    tcCIF = TextEditingController();
    tcCode = TextEditingController();
    tcAddress = TextEditingController();
    tcCity = TextEditingController();
    tcProvince = TextEditingController();
    tcPostalCode = TextEditingController();
    discardChanges();
    super.initState();
  }

  @override
  void dispose() {
    tcName.dispose();
    tcPhone.dispose();
    tcEmail.dispose();
    tcCIF.dispose();
    tcCode.dispose();
    tcAddress.dispose();
    tcCity.dispose();
    tcProvince.dispose();
    tcPostalCode.dispose();
    super.dispose();
  }

  void discardChanges() {
    tcName.text = LocalDataRepository().user?.name ?? '';
    tcPhone.text = LocalDataRepository().user?.phone ?? '';
    tcEmail.text = LocalDataRepository().user?.email ?? '';
    tcCIF.text = LocalDataRepository().user?.cif ?? '';
    tcCode.text = LocalDataRepository().user?.code ?? '';
    tcAddress.text = LocalDataRepository().user?.address ?? '';
    tcCity.text = LocalDataRepository().user?.city ?? '';
    tcProvince.text = LocalDataRepository().user?.province ?? '';
    tcPostalCode.text = LocalDataRepository().user?.postalCode ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyAccountCubit>();
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: MyBody(child: BlocBuilder<MyAccountCubit, MyAccountState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Mi Cuenta', style: AppTextStyle.h1Style),
                    spacerXs,
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return Text(
                          state.user?.name ?? '',
                          style: AppTextStyle.h3Style.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      },
                    ),
                    spacerM,
                    const ImageProfile(),
                    spacerM,
                    MyInput(
                      label: 'Nombre*',
                      hintText: 'Nombre',
                      validator: validateData,
                      onChanged: cubit.name,
                      controller: tcName,
                    ),
                    MyInput(
                      label: 'Teléfono móvil*',
                      hintText: 'Teléfono móvil',
                      validator: validateData,
                      onChanged: cubit.phone,
                      controller: tcPhone,
                    ),
                    MyInput(
                      label: 'E-mail*',
                      hintText: 'E-mail',
                      validator: validateEmail,
                      onChanged: cubit.email,
                      controller: tcEmail,
                    ),
                    MyInput(
                      label: 'CIF',
                      hintText: 'CIF',
                      onChanged: cubit.cif,
                      controller: tcCIF,
                    ),
                    MyInput(
                      label: 'Código',
                      hintText: 'Código',
                      onChanged: cubit.code,
                      readOnly: true,
                      controller: tcCode,
                    ),
                    MyInput(
                      label: 'Dirección',
                      hintText: 'Dirección',
                      onChanged: cubit.address,
                      controller: tcAddress,
                    ),
                    MyInput(
                      label: 'Ciudad',
                      hintText: 'Ciudad',
                      onChanged: cubit.city,
                      controller: tcCity,
                    ),
                    MyInput(
                      label: 'Provincia',
                      hintText: 'Provincia',
                      onChanged: cubit.province,
                      controller: tcProvince,
                    ),
                    MyInput(
                      label: 'Código Postal',
                      hintText: 'Código Postal',
                      onChanged: cubit.postalCode,
                      controller: tcPostalCode,
                    ),
                    MyButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          cubit.updateUser().then((v) {
                            if (v != null) {
                              unawaited(context.read<UserCubit>().getUser());
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(v)));
                            }
                          });
                        }
                      },
                      text: 'Guardar cambios',
                      isLoading: state.status == FormStatus.loading,
                    ),
                    spacerS,
                    MyButton(
                      onPressed: () {
                        discardChanges();
                      },
                      text: 'Descartar cambios',
                      variant: MyButtonVariant.outlinedBold,
                    ),
                    spacerS,
                    MyButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const DialogConfirmDeleteAccount();
                            });
                      },
                      text: 'Eliminar cuenta',
                      variant: MyButtonVariant.outlinedBold,
                    ),
                    spacerM,
                    Text(
                      'Eliminación de cuenta',
                      style: AppTextStyle.h3Style.copyWith(
                        fontWeight: FontWeight.normal,fontSize: 22,
                      ),
                    ),
                    spacerS,
                    Text(
                      'Protección de datos personales',
                      style: AppTextStyle.h3Style.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey[600]
                      ),
                    ),
                    spacerXs,
                    Text(
                      'En nombre de VEMARE, S.L. Valoramos tu privacidad y el control que tienes sobre tus datos personales. Si en algún momento deseas eliminar tu cuenta de usuario, solo debes hacer clic en este botón, eliminarás permanentemente tu cuenta de usuario.',
                      style: AppTextStyle.h3Style.copyWith(
                        fontWeight: FontWeight.normal,color: Colors.grey[500]
                      ),
                    ),
                    spacerM,
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}

class DialogConfirmDeleteAccount extends StatefulWidget {
  const DialogConfirmDeleteAccount({
    super.key,
  });

  @override
  State<DialogConfirmDeleteAccount> createState() =>
      _DialogConfirmDeleteAccountState();
}

class _DialogConfirmDeleteAccountState
    extends State<DialogConfirmDeleteAccount> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            spacerS,
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.error200),
              child: const Icon(
                Icons.warning_amber_rounded,
                color: AppColor.error,
              ),
            ),
            spacerS,
            Text(
              '¿Desea eliminar su cuenta?',
              style: AppTextStyle.nunitoSans800.copyWith(fontSize: 24),
            ),
            spacerXL,
            MyButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                var res = await getIt.get<AuthRepository>().deleteUser();
                if (res) {
                  context.read<UserCubit>().deleteUser();
                  LocalDataRepository().logOut().then((_) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginPage.route, (route) => false);
                  });
                }
                setState(() {
                  loading = false;
                });
              },
              text: 'Eliminar',
              width: double.infinity,
              isLoading: loading,
            ),
            spacerS,
            MyButton(
              onPressed: () => Navigator.pop(context),
              text: 'Cancelar',
              variant: MyButtonVariant.outlinedBold,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyAccountCubit>();
    final userState = context.read<UserCubit>().state;
    return BlocBuilder<MyAccountCubit, MyAccountState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 170,
              width: 170,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: state.foto != null
                  ? Image.file(state.foto!, fit: BoxFit.cover)
                  : userState.user?.logo != null
                      ? Image.network(
                          userState.user!.logo!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/imgs/profile_default.png',
                          fit: BoxFit.cover,
                          scale: 2,
                        ),
            ),
            //LocalDataRepository().user?.role?.id == 2 ?
                 SizedBox(
                    width: 220,
                    child: MyIconButton(
                      onPressed: () {
                        ImageUtil.getImagePicker(
                          context,
                          ImageSource.gallery,
                          cubit.updatePhoto,
                        );
                      },
                      text: 'Cargar otra imagen',
                      icon: Image.asset(
                        'assets/icons/mas.png',
                        scale: 2,
                      ),
                      variant: MyButtonVariant.link,
                    ),
                  )
                //: spacerXL
          ],
        );
      },
    );
  }
}
