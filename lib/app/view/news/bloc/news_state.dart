import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/notices.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(<News>[]) List<News> news,
    @Default(<News>[]) List<News> mostRead,
  }) = _NewsState;
  const NewsState._();
}
