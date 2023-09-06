import 'package:bloc/bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/domain/model/center.dart';
import 'package:vemare/app/domain/model/header.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_state.dart';

class WhereWeAreCubit extends Cubit<WhereWeAreState> {
  WhereWeAreCubit(
    this._centerRepository,
    this._headerRepository,
  ) : super(WhereWeAreState(location: LatLng(40.416775, -3.703790))) {
    fetchData();
  }

  final CenterRepository _centerRepository;
  final HeaderRepository _headerRepository;

  Future<void> fetchData({String? city, String? postalCode}) async {
    emit(state.copyWith(
        loadingCenters: true, loadingData: state.countries.isEmpty));

    List<Center> centers = await _centerRepository.getCenters(
        city: city ?? '', postalCode: postalCode ?? '');

    LatLng? firstPosition;

    if (centers.isNotEmpty) {
      firstPosition = LatLng(double.parse(centers.first.latitude ?? '0'),
          double.parse(centers.first.longitude ?? '0'));
    }

    List<String> countries = [];
    List<String> postalCodes = [];
    for (var center in centers) {
      if (center.city != null && !countries.contains(center.city)) {
        countries.add(center.city!);
      }
      if (center.postalCode != null &&
          !postalCodes.contains(center.postalCode)) {
        postalCodes.add(center.postalCode!);
      }
    }

    Header header = await _headerRepository.getHeaders(module: "Center");

    emit(state.copyWith(
      centers: centers,
      header: header,
      centerSelect: firstPosition ?? state.location,
      countries: state.countries.isEmpty ? countries : state.countries,
      postalCodes: state.postalCodes.isEmpty ? postalCodes : state.postalCodes,
      loadingData: false,
      loadingCenters: false,
    ));
  }

  void centerGoMap(LatLng latLng) {
    emit(state.copyWith(centerSelect: latLng));
  }

  void openEmail({
    required String toEmail,
  }) async {
    String url =
        "mailto:$toEmail?subject=${Uri.encodeQueryComponent(' ')}&body=${Uri.encodeQueryComponent('')}";
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }
}
