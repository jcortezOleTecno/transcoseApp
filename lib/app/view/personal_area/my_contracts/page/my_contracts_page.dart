import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/conventions.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_contracts_cubit.dart';
import 'crd.dart';
import 'millennium.dart';
import 'pmp.dart';
import 'rappels.dart';

class MyContractsPage extends StatelessWidget {
  const MyContractsPage._();
  static const route = '/my_contracts';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyContratsCubit(
        getIt.get<ContratsRepository>(),
      ),
      child: const MyContractsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return Scaffold(
      body: MyBody(
        child: permissions!.where((e) => e.id == 9).isEmpty && isEmpleado
            ? const AccessDeniedWidget()
            : DefaultTabController(
                length: 5,
                child: Column(
                  children: [
                    spacerS,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _TapBar(),
                    ),
                    const Divider(
                      height: 0,
                      thickness: 2,
                      indent: 15,
                      endIndent: 15,
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Rappels(),
                          Millennium(),
                          Conventions(),
                          PMP(),
                          CRD(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _TapBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TabBar(
      labelColor: AppColor.primaryBlue,
      indicatorColor: AppColor.primaryBlue,
      indicatorWeight: 2.5,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
          color: AppColor.blue100,
          border: Border(
            bottom: BorderSide(color: AppColor.primaryBlue, width: 2.5),
          )),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      unselectedLabelColor: AppColor.primaryBlue,
      isScrollable: false,
      labelPadding: EdgeInsets.symmetric(horizontal: 0.5),
      tabs: [
        Tab(text: 'Rappels'),
        Tab(text: 'Millennium'),
        Tab(text: 'Convenciones'),
        Tab(text: 'PMP'),
        Tab(text: 'CRD'),
      ],
    );
  }
}
