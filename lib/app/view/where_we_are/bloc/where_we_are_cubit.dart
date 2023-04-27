import 'package:bloc/bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/domain/model/center.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_state.dart';

class WhereWeAreCubit extends Cubit<WhereWeAreState> {
  WhereWeAreCubit(
    this._centerRepository,
  ) : super(WhereWeAreState(location: LatLng(40.416775, -3.703790))) {
    fetchData();
  }

  final CenterRepository _centerRepository;

  Future<void> fetchData({String? city, String? postalCode}) async {
    emit(state.copyWith(loadingCenters: true));
    List<Center> centers = await _centerRepository.getCenters(
        city: city ?? '', postalCode: postalCode ?? '');
    LatLng? firstPosition;
    if (centers.isNotEmpty) {
      firstPosition = LatLng(double.parse(centers.first.latitude ?? '0'),
          double.parse(centers.first.longitude ?? '0'));
    }
    emit(state.copyWith(
      centers: centers,
      centerSelect: firstPosition ?? state.location,
      loadingCenters: false,
    ));
  }

  void centerGoMap(LatLng latLng) {
    emit(state.copyWith(centerSelect: latLng));
  }
}
