import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/domain/model/center.dart' as w;
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_cubit.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_state.dart';
import 'package:vemare/config/service_locator.dart';

class WhereWeArePage extends StatelessWidget {
  const WhereWeArePage._();
  static const route = '/where_we_are';

  static Widget create() {
    return BlocProvider(
      create: (context) => WhereWeAreCubit(
        getIt.get<CenterRepository>(),
      ),
      child: const WhereWeArePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WhereWeAreCubit, WhereWeAreState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MyBody(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Row(
                  children: const [
                    MyBackButton(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('¿Dónde estamos?', style: AppTextStyle.h1Style),
                      spacerM,
                      MyInput(label: 'Ciudad', hintText: 'Escribe una ciudad'),
                      MyInput(
                          label: 'Código postal',
                          hintText: 'Escribe una código postal'),
                      _Map(),
                      spacerM,
                      state.centers.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: MyShimmer(
                                height: 250,
                                margin: EdgeInsets.zero,
                              ),
                            )
                          : Column(
                              children: state.centers
                                  .map((e) => _Item(center: e))
                                  .toList(),
                            )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        'assets/imgs/map.png',
        scale: 2,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.center});
  final w.Center center;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            ),
            child: Image.network(
              center.image!,
              scale: 2,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(center.name ?? '', style: AppTextStyle.titleCard),
                spacerS,
                Text(
                  center.description ?? '',
                  style: AppTextStyle.defaultStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
