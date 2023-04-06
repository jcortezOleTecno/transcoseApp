import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/view/my_services/services/bloc/services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(
    this._servicesRepository,
  ) : super(const ServicesState()) {
    fetchData();
  }

  final ServicesRepository _servicesRepository;

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    List<Services> services = await _servicesRepository.getServices(limit: 0);
    emit(state.copyWith(services: services, loading: false));
  }
}
