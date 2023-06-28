import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/utils/image_util.dart';
import 'package:vemare/app/domain/utils/validators.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_cubit.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_state.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage._();
  static const route = '/my_account';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyAccountCubit(),
      child: const MyAccountPage._(),
    );
  }

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: MyBody(
            child: BlocConsumer<MyAccountCubit, MyAccountState>(
          listener: (context, state) {
            // TODO: implement listener
          },
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
                    Text(
                      LocalDataRepository().user?.name ?? '',
                      style: AppTextStyle.h3Style.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    spacerM,
                    ImageProfile(),
                    spacerM,
                    MyInput(
                      label: 'Nombre*',
                      initialValue: LocalDataRepository().user?.name ?? '',
                      validator: validateData,
                    ),
                    MyInput(
                      label: 'Teléfono*',
                      initialValue: LocalDataRepository().user?.phone,
                      validator: validateData,
                    ),
                    MyInput(
                      label: 'E-mail*',
                      initialValue: LocalDataRepository().user?.email ?? '',
                      validator: validateEmail,
                    ),
                    MyInput(
                      // label: 'CIF',
                      label: 'Código',
                      initialValue: LocalDataRepository().user?.cif ?? '',
                    ),
                    // MyInput(
                    //   label: 'ID',
                    //   initialValue:
                    //       LocalDataRepository().user?.parentId.toString() ?? '',
                    // ),
                    MyInput(
                      label: 'Dirección',
                      initialValue: LocalDataRepository().user?.address ?? '',
                    ),
                    MyInput(
                      label: 'Ciudad',
                      initialValue: LocalDataRepository().user?.city ?? '',
                    ),
                    MyInput(
                      label: 'Provincia',
                      initialValue: LocalDataRepository().user?.province ?? '',
                    ),
                    MyInput(
                      label: 'Código Postal',
                      initialValue:
                          LocalDataRepository().user?.postalCode ?? '',
                    ),
                    MyButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        text: 'Guardar cambios'),
                    spacerS,
                    MyButton(
                      onPressed: () {},
                      text: 'Descartar cambios',
                      variant: MyButtonVariant.outlinedBold,
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

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyAccountCubit>();
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
                  : Image.asset(
                      'assets/imgs/profile_default.png',
                      fit: BoxFit.cover,
                      scale: 2,
                    ),
            ),
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
          ],
        );
      },
    );
  }
}
