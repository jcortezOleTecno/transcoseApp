import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_cubit.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_state.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage._();
  static const route = '/my_account';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyAccountCubit(
        LocalDataRepository(),
      ),
      child: const MyAccountPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
          child: BlocConsumer<MyAccountCubit, MyAccountState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Mi Cuenta', style: AppTextStyle.h1Style),
                spacerXs,
                Text(
                  state.user?.name ?? '',
                  style: AppTextStyle.h3Style.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                spacerM,
                MyInput(
                  label: 'Nombre',
                  initialValue: state.user?.name ?? '',
                ),
                MyInput(
                  label: 'Teléfono',
                  initialValue: state.user?.phone,
                ),
                MyInput(
                  label: 'E-mail',
                  initialValue: state.user?.email ?? '',
                ),
                MyInput(
                  label: 'Contraseña',
                  initialValue: '***********',
                ),
                MyInput(
                  label: 'CIF',
                  initialValue: state.user?.cif ?? '',
                ),
                MyInput(
                  label: 'ID',
                  initialValue: state.user?.parentId.toString() ?? '',
                ),
                MyInput(
                  label: 'Dirección de envío',
                  initialValue: 'Calle Santa Eugenia 45',
                ),
                MyInput(
                  label: 'Dirección de facturación',
                  initialValue: 'Calle Santa Eugenia 45',
                ),
                MyButton(onPressed: () {}, text: 'Guardar cambios'),
                spacerS,
                MyButton(
                  onPressed: () {},
                  text: 'Descartar cambios',
                  variant: MyButtonVariant.outlinedBold,
                ),
                spacerM,
              ],
            ),
          );
        },
      )),
    );
  }
}
