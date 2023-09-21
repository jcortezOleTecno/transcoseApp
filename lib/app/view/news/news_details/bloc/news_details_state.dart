import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/article_news_details.dart';

part 'news_details_state.freezed.dart';

@freezed
class NewsDetailsState with _$NewsDetailsState {
  const factory NewsDetailsState({
    String? id,
    ArticleNewsDetails? details,
  }) = _NewsDetailsState;
  const NewsDetailsState._();
}
