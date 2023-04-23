import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/domain/model/center.dart' as w;
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_cubit.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_state.dart';
import 'package:vemare/config/service_locator.dart';

import '../theme/color.dart';

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
                      // MyInput(label: 'Ciudad', hintText: 'Escribe una ciudad'),
                      // MyInput(
                      //     label: 'Código postal',
                      //     hintText: 'Escribe una código postal'),
                      const _Map(),
                      spacerXL,
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

class _Item extends StatelessWidget {
  const _Item({required this.center});
  final w.Center center;
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WhereWeAreCubit>();
    return GestureDetector(
      onTap: () => cubit.centerGoMap(LatLng(
          double.parse(center.latitude ?? '0'),
          double.parse(center.longitude ?? '0'))),
      child: Card(
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
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
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
                  MyHtml(text: center.description ?? '')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Map extends StatefulWidget {
  const _Map({
    Key? key,
  }) : super(key: key);

  @override
  State<_Map> createState() => _MapState();
}

class _MapState extends State<_Map> {
  static const String accessToken =
      'sk.eyJ1IjoiYWJkaWVsY2FzdGxsIiwiYSI6ImNsZ2JjajB1MjAzemwzamxucXpjM2xrMjAifQ.7hl0kbOtMwMWTGgUGcG2iQ';

  final controller = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhereWeAreCubit, WhereWeAreState>(
      listener: (context, state) {
        if (state.centerSelect != null) {
          controller.move(state.centerSelect!, 14);
        }
      },
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 250,
            child: state.loading
                ? const MyShimmer.full()
                : FlutterMap(
                    mapController: controller,
                    options: MapOptions(
                      center: state.location,
                      absorbPanEventsOnScrollables: true,
                      enableScrollWheel: false,
                      maxZoom: 25,
                      minZoom: 5,
                      zoom: 14,
                      debugMultiFingerGestureWinner: true,
                      enableMultiFingerGestureRace: true,
                    ),
                    nonRotatedChildren: [
                      TileLayer(
                        urlTemplate:
                            'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                        additionalOptions: const {
                          'accessToken': accessToken,
                          'id': 'mapbox/satellite-streets-v12'
                        },
                        maxZoom: 25,
                        minZoom: 5,
                        zoomOffset: 0.0,
                        maxNativeZoom: 25,
                        minNativeZoom: 5,
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: state.location!,
                            builder: (context) {
                              return const Icon(
                                Icons.location_on_rounded,
                                color: AppColor.primaryBlue,
                                size: 35,
                              );
                            },
                          ),
                          ...state.centers.map(
                            (e) => Marker(
                              point: LatLng(double.parse(e.latitude ?? '0'),
                                  double.parse(e.longitude ?? '0')),
                              width: 80,
                              height: 60,
                              builder: (context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: AppColor.primaryBlue,
                                      size: 35,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.name ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
