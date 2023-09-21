import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/article_library_details.dart';

part 'library_details_state.freezed.dart';

@freezed
class LibraryDetailsState with _$LibraryDetailsState {
  const factory LibraryDetailsState({
    String? id,
    ArticleLibraryDetails? details,
  }) = _LibraryDetailsState;
  const LibraryDetailsState._();
}
