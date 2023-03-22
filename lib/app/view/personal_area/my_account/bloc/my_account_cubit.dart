import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/personal_area/my_account/bloc/my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit(this._localDataRepository)
      : super(MyAccountState(
          user: _localDataRepository.user,
        ));

  final LocalDataRepository _localDataRepository;
}
