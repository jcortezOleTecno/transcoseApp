import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_pdf_contracts.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_contracts_cubit.dart';
import 'bloc/my_contracts_state.dart';
import 'rappels.dart';

class Conventions extends StatelessWidget {
  const Conventions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();
    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Column(
                  children: [
                    const Text('Mis convenciones', style: AppTextStyle.h1Style),
                    const UserName(),
                    spacerL,
                    const Text(
                      'Filtrar por año',
                      style: AppTextStyle.inputLabelStyle,
                    ),
                    MyCustomDropdownButton(
                        hint: DateTime.now().year.toString(),
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
                        value: state.yearSelectMill,
                        onChanged: (value) {
                          cubit.getMill(value!);
                        }),
                    spacerM,

                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        );
      },
    );
  }

  Widget mainInformation(){
    return Container();
  }

}