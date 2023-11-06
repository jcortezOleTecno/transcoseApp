import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters_returns.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_new_orders_provider.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/providers/returns_provider.dart';
import 'package:vemare/app/view/personal_area/my_orders/returns/widgets/returns_details.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ReturnsNewOrdersScreen extends StatelessWidget {
  const ReturnsNewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => ReturnsNewOrdersProvider(getIt.get<ContratsRepository>(),context),
        child: Consumer<ReturnsNewOrdersProvider>(
            builder: (context2, provider, child){
              return Scaffold(
                body: MyBody(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyBackButton(),
                              const Text('Nuevo pedido de devolución', style: AppTextStyle.h2Style),
                              const UserName(),
                              spacerS,spacerS,
                              MyIconButton(
                                onPressed: () {

                                },
                                text: provider.filter.quantityFilter().isNotEmpty ? 'Modificar filtros' : 'Aplicar filtros',
                                icon: Image.asset( 'assets/icons/Filtro.png', scale: 2,),
                                variant: MyButtonVariant.outlinedBold,
                              ),
                              spacerS,spacerS,
                              //filterAplicados(provider: provider),
                              if(provider.loadData)...[
                                spacerS,spacerS,
                                const SizedBox(
                                    height: 400,
                                    child: MyShimmer.full(
                                      borderRadius: 10,
                                      margin: EdgeInsets.only(bottom: 20),
                                    )),
                              ]else...[
                                // if(provider.listReturns.isEmpty)...[
                                //   const NoExistWidget('pedidos',paddingTop: 40),
                                //   spacerM,spacerM,
                                // ]else...[
                                //   spacerS,spacerS,
                                //   tablaPedidos(provider: provider),
                                // ],
                              ],
                            ],
                          ),
                        ),
                        spacerM,
                        const Footer()
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }

}