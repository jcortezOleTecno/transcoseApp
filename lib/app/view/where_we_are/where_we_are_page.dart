import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/domain/model/center.dart' as w;
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input_autocomplete.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_cubit.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_state.dart';
import 'package:vemare/config/service_locator.dart';

import '../theme/color.dart';

class WhereWeArePage extends StatefulWidget {
  const WhereWeArePage._();
  static const route = '/where_we_are';

  static Widget create() {
    return BlocProvider(
      create: (context) => WhereWeAreCubit(
        getIt.get<CenterRepository>(),
        getIt.get<HeaderRepository>(),
      ),
      child: const WhereWeArePage._(),
    );
  }

  @override
  State<WhereWeArePage> createState() => _WhereWeArePageState();
}

class _WhereWeArePageState extends State<WhereWeArePage> {
  late ScrollController controller;
  late TextEditingController tcCity;
  late TextEditingController tcCode;

  @override
  void initState() {
    controller = ScrollController();
    tcCity = TextEditingController();
    tcCode = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    tcCity.dispose();
    tcCode.dispose();
    super.dispose();
  }

  GlobalKey<AutoCompleteTextFieldState<String>> keyCity = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> keyCodes = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WhereWeAreCubit>();
    return Scaffold(
      body: BlocBuilder<WhereWeAreCubit, WhereWeAreState>(
        builder: (context, state) {
          return MyBody(
            child: ListView(
              controller: controller,
              padding: EdgeInsets.zero,
              children: [
                const Row(
                  children: [
                    MyBackButton(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(state.header?.title ?? '',
                          style: AppTextStyle.h1Style),
                      spacerM,
                      state.loadingData
                          ? const MyShimmer(
                              height: 66,
                              margin: EdgeInsets.zero,
                              borderRadius: 4)
                          : MyInputAutoComplete(
                              keyComplete: keyCity,
                              suggestions: state.countries,
                              hintText: 'Escribe una ciudad',
                              label: 'Ciudad',
                              textInputAction: TextInputAction.search,
                              textCapitalization: TextCapitalization.words,
                              textChanged: (_) => tcCode.clear(),
                              textSubmitted: (city) {
                                cubit.fetchData(city: city);
                                tcCode.clear();
                              },
                              controller: tcCity,
                            ),
                      spacerS,
                      state.loadingData
                          ? const MyShimmer(
                              height: 66,
                              margin: EdgeInsets.zero,
                              borderRadius: 4)
                          : MyInputAutoComplete(
                              keyComplete: keyCodes,
                              suggestions: state.postalCodes,
                              hintText: 'Escribe un código postal',
                              label: 'Código postal',
                              textInputAction: TextInputAction.search,
                              inputType: TextInputType.number,
                              textCapitalization: TextCapitalization.words,
                              textChanged: (_) => tcCity.clear(),
                              textSubmitted: (code) {
                                cubit.fetchData(postalCode: code);
                                tcCity.clear();
                              },
                              controller: tcCode,
                            ),
                      spacerM,
                      const _Map(),
                      spacerXL,
                      if (state.loadingCenters)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: MyShimmer(
                            height: 250,
                            margin: EdgeInsets.zero,
                          ),
                        ),
                      if (!state.loadingCenters && state.centers.isNotEmpty)
                        Column(
                          children: state.centers
                              .map((e) => _Item(controller, center: e))
                              .toList(),
                        ),
                      if (!state.loadingCenters && state.centers.isEmpty) ...[
                        const NoExistWidget('centros', paddingTop: 0),
                        spacerXL,
                      ]
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
  const _Item(this.controller, {required this.center});
  final w.Center center;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<WhereWeAreCubit>();
    return GestureDetector(
      onTap: () async {
        await controller.animateTo(0.0,
            curve: Curves.linear, duration: const Duration(milliseconds: 300));
        cubit.centerGoMap(LatLng(double.parse(center.latitude ?? '0'),
            double.parse(center.longitude ?? '0')));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                  ),
                  child: MyNetworkImage(
                    image: center.image!,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: InkWell(
                    onTap: (){
                      launchUrlString(center.googleMaps, mode: LaunchMode.externalApplication);
                    },
                    child: ClipOval(
                      child: Container(
                        color: AppColor.white,
                        height: 40, width: 40,
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          'assets/icons/google_maps_icon.png',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(center.name ?? '', style: AppTextStyle.h3Style),
                  if (center.exclusiveSale ?? false) ...[
                    spacerXs,
                    Text('Venta exclusiva a profesionales.',
                        style: AppTextStyle.titleCard
                            .copyWith(color: AppColor.error)),
                  ],
                  spacerS,
                  Text(
                      '${center.postalCode}, ${center.city}, ${center.province}, España',
                      style: AppTextStyle.defaultStyle),
                  spacerS,
                  _phone(),
                  spacerS,
                  Row(
                    children: [
                      const Icon(
                        Icons.mail_outline_outlined,
                        color: AppColor.primaryBlue,
                      ),
                      spacerS,
                      GestureDetector(
                        onTap: () {
                          cubit.openEmail(toEmail: center.email ?? '');
                        },
                        child: Text(
                          center.email ?? '',
                          style: AppTextStyle.linkStyle,
                        ),
                      ),
                    ],
                  ),
                  if (center.url != null) ...[
                    spacerS,
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_iphone_rounded,
                          color: AppColor.primaryBlue,
                        ),
                        spacerS,
                        GestureDetector(
                          onTap: () {
                            launchUrlString(center.url ?? '',
                                mode: LaunchMode.externalApplication);
                          },
                          child: Text(
                            center.url ?? '',
                            style: AppTextStyle.linkStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                  // spacerS,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phone() {
    if (center.phone!.contains('/')) {
      List<String> phones = center.phone!.split("/");
      return Row(
        children: [
          Image.asset(
            'assets/icons/Phone.png',
            color: AppColor.primaryBlue,
            scale: 2,
          ),
          spacerS,
          GestureDetector(
            onTap: () async {
              await launchUrlString('tel:${phones[0]}');
            },
            child: Text(
              phones[0],
              style: AppTextStyle.linkStyle,
            ),
          ),
          const Text(
            ' / ',
            style: AppTextStyle.linkStyle,
          ),
          GestureDetector(
            onTap: () async {
              await launchUrlString('tel:${phones[1]}');
            },
            child: Text(
              phones[1],
              style: AppTextStyle.linkStyle,
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        Image.asset(
          'assets/icons/Phone.png',
          color: AppColor.primaryBlue,
          scale: 2,
        ),
        spacerS,
        GestureDetector(
          onTap: () async {
            await launchUrlString('tel:${center.phone}');
          },
          child: Text(
            center.phone ?? '',
            style: AppTextStyle.linkStyle,
          ),
        )
      ],
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
                initialCenter: state.location ?? const LatLng(0.0, 0.0),
                maxZoom: 25,
                minZoom: 5,
                initialZoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: const {
                    'accessToken': accessToken,
                    'id': 'mapbox/streets-v12'
                  },
                  maxZoom: 25,
                  minZoom: 5,
                  zoomOffset: 0.0,
                  maxNativeZoom: 25,
                  minNativeZoom: 5,
                ),
                if (state.centers.isNotEmpty)
                  MarkerLayer(
                    markers: [
                      Marker(
                          point: state.location!,
                          child: const Icon(
                            Icons.location_on_rounded,
                            color: AppColor.primaryBlue,
                            size: 35,
                          )
                      ),
                      ...state.centers.map(
                            (e) => Marker(
                          point: LatLng(double.parse(e.latitude ?? '0'), double.parse(e.longitude ?? '0')),
                          width: 80,
                          height: 60,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
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
                          ),
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
