import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/library_repository.dart';
import 'package:vemare/app/domain/model/library.dart';
import 'package:vemare/app/view/library/bloc/library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit(
    this._noticesRepository,
  ) : super(const LibraryState()) {
    fetchData();
  }

  final LibraryRepository _noticesRepository;

  Future<void> fetchData() async {
    List<Library> library = await _noticesRepository.getLibraries(limit: 0);
    emit(state.copyWith(library: library));
  }
}
