import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/modelo_347.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import '../widgets/no_contracts.dart';
import 'bloc/modelo_347_cubit.dart';
import 'bloc/modelo_347_state.dart';

class Modelo347Page extends StatelessWidget {
  const Modelo347Page._();
  static const route = '/modelo_347';

  static Widget create() {
    return BlocProvider(
      create: (context) => Modelo347Cubit(
        getIt.get<MyAccountRepository>(),
      ),
      child: const Modelo347Page._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<Modelo347Cubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return Scaffold(
      body: MyBody(
        child: permissions!.where((e) => e.id == 8).isEmpty && isEmpleado
            ? const AccessDeniedWidget()
            : BlocBuilder<Modelo347Cubit, Modelo347State>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Modelo 347', style: AppTextStyle.h1Style),
                              const UserName(),
                              spacerL,
                              const Text('Filtrar por año',style: AppTextStyle.inputLabelStyle,),
                              SizedBox(
                                width: double.infinity,
                                child: MyCustomDropdownButton(
                                    hint: DateTime(DateTime.now().year - 1)
                                        .year
                                        .toString(),
                                    hintStyle: AppTextStyle.inputStyle,
                                    dropdownItems: yearsList
                                        .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTextStyle.inputStyle),
                                    ))
                                        .toList(),
                                    value: state.yearSelect,
                                    onChanged: (value) {
                                      cubit.getMy347(year: value);
                                    }),
                              ),
                              if (state.loading)...[
                                spacerM,
                                ...List.generate(4, (i) {
                                  return const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: MyShimmer(
                                      height: 75,
                                      margin: EdgeInsets.zero,
                                    ),
                                  );
                                }),
                              ],
                              if (!state.loading && state.modelos.isEmpty)...[
                                const NoExistWidget('modelos 347'),
                                spacerM,spacerM,spacerM,
                              ],
                              if (!state.loading)...[
                                spacerM,
                                ...state.modelos.map((e) => _Item(e)).toList(),
                              ]
                            ],
                          ),
                        ),
                        const Footer(),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
    this.modelo, {
    Key? key,
  }) : super(key: key);

  final Modelo347 modelo;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Row(
        children: [
          Expanded(child: Item(title: 'PERIODO', content: modelo.name ?? '')),
          Expanded(child: Item(title: 'TOTAL', content: '${modelo.value}€')),
        ],
      ),
    );
  }
}
