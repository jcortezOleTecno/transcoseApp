import 'package:bloc/bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:vemare/app/data/center_repository.dart';
import 'package:vemare/app/domain/model/center.dart';
import 'package:vemare/app/view/where_we_are/bloc/where_we_are_state.dart';

class WhereWeAreCubit extends Cubit<WhereWeAreState> {
  WhereWeAreCubit(
    this._centerRepository,
  ) : super(const WhereWeAreState()) {
    fetchData();
  }

  final CenterRepository _centerRepository;

  Future<void> fetchData() async {
    List<Center> centers = await _centerRepository.getCenters(limit: 0);
    emit(state.copyWith(centers: centers));
  }

  final _kInitialLocation = LatLng(40.416775, -3.703790);

  Future<void> requestPermission() async {
    if (state.location != null) return;
    emit(state.copyWith(loading: true));
    final locationPlugin = Location();
    var permissionGranted = await locationPlugin.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationPlugin.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return emit(
          state.copyWith(
            location: _kInitialLocation,
            loading: false,
          ),
        );
      }
    }
    final locationData = await locationPlugin.getLocation();
    final userLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    emit(
      state.copyWith(
        location: userLocation,
        loading: false,
      ),
    );
  }

  void centerGoMap(LatLng latLng) {
    emit(state.copyWith(centerSelect: latLng));
  }
}
