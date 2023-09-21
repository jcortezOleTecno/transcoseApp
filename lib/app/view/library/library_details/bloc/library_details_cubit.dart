import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/library_repository.dart';

import 'library_details_state.dart';

class LibraryDetailsCubit extends Cubit<LibraryDetailsState> {
  LibraryDetailsCubit(
    this._libraryRepository,
    String? id,
  ) : super(LibraryDetailsState(id: id)) {
    fetchData();
  }

  final LibraryRepository _libraryRepository;

  Future<void> fetchData() async {
    var res = await _libraryRepository.getDetails(state.id!);
    emit(state.copyWith(
      details: res,
    ));
  }
}
