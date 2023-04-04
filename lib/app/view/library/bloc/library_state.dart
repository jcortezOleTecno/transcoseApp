import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/library.dart';

part 'library_state.freezed.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState({
    @Default(<Library>[]) List<Library> library,
  }) = _LibraryState;
  const LibraryState._();
}
