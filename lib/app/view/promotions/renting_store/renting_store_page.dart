import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/shopping_cart_repository.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/promotions/renting_store/bloc/renting_store_cubit.dart';
import 'package:vemare/app/view/promotions/renting_store/widgets/promotion_description.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../detail_sale_rent/detail_sale_rent.dart';
import 'bloc/renting_store_state.dart';

class RentingStorePage extends StatelessWidget {
  const RentingStorePage._();
  static const route = '/renting_store';

  static Widget create(StoreArgs args) {
    return BlocProvider(
      create: (context) => RentingStoreCubit(
        getIt<ShoppingCardRepository>(),
        args,
      ),
      child: const RentingStorePage._(),
    );
  }

  // final StoreArgs args;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RentingStoreCubit>();
    return BlocConsumer<RentingStoreCubit, RentingStoreState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) async {
        if (state.status == FormStatus.done) {
          await launchUrlString(state.payResponse?.urlPayment ?? '');
        }
        if (state.status == FormStatus.error) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.payResponse?.message ?? '')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: MyBody(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyBackButton(),
                        PromotionDescription(
                          title: state.arg!.isTienda ? 'Tienda' : 'Renting',
                          promotion: state.arg!.promotion,
                          quantity: state.arg!.quantity,
                        ),
                        spacerL,
                        Visibility(
                          visible: state.arg!.isTienda,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  '¿Como deseas realizar tu pago?',
                                  style: AppTextStyle.h3Style,
                                ),
                                RadioGroup<String?>.builder(
                                  groupValue: state.type,
                                  activeColor: AppColor.blue,
                                  direction: Axis.vertical,
                                  horizontalAlignment: MainAxisAlignment.center,
                                  textStyle: AppTextStyle.inputLabelStyle,
                                  onChanged: cubit.selectType,
                                  items: (LocalDataRepository()
                                              .user
                                              ?.webservice
                                              ?.permiteComprasCredito ??
                                          false)
                                      ? ['Crédito', 'Tarjeta']
                                      : ['Tarjeta'],
                                  itemBuilder: (value) => RadioButtonBuilder(
                                    value!,
                                    textPosition: RadioButtonTextPosition.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _Button(
                  state.arg!.copyWith(isCredit: state.type == 'Crédito'),
                  selecType: state.type != null,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
    this.args, {
    required this.selecType,
    Key? key,
  }) : super(key: key);

  final StoreArgs args;
  final bool selecType;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RentingStoreCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: BlocBuilder<RentingStoreCubit, RentingStoreState>(
        builder: (context, state) {
          return MyButton(
            onPressed: () {
              if (LocalDataRepository().isLogged) {
                cubit.orderPaymentUnique();
              } else {
                Navigator.pushNamed(
                  context,
                  LoginPage.route,
                  arguments: '',
                ).then((_) {
                  if (LocalDataRepository().isLogged) {
                    cubit.orderPaymentUnique();
                  }
                });
              }
            },
            text: 'Continuar',
            width: double.infinity,
            disabled: args.isTienda && !selecType,
            isLoading: state.status == FormStatus.loading,
          );
        },
      ),
    );
  }
}
