import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/article_abou_us.dart';

part 'our_history_state.freezed.dart';

@freezed
class OurHistoryState with _$OurHistoryState {
  const factory OurHistoryState({
    @Default(<ArticleAboutUs>[]) List<ArticleAboutUs> articles,
  }) = _OurHistoryState;
  const OurHistoryState._();
}
