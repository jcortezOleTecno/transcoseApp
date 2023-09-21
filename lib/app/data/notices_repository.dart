import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/article_news_details.dart';
import 'package:vemare/app/domain/model/notices.dart';

class NoticesRepository {
  final MyApiClient _apiClient;

  NoticesRepository(this._apiClient);

  Future<NoticesResponse> getNotices({int limit = 0}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/noticias',
        params: <String, dynamic>{'limit': '$limit'});
    return NoticesResponse(
        news: (res["data"] as List).map(News.fromJson).toList(),
        mostRead: (res["most_read"] as List).map(News.fromJson).toList());
  }

  Future<ArticleNewsDetails> getNoticesDetails(String id) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/noticias/detalle',
        params: <String, dynamic>{'id': id});
    return ArticleNewsDetails.fromJson(res);
  }
}

class NoticesResponse {
  final List<News> mostRead;
  final List<News> news;

  NoticesResponse({required this.mostRead, required this.news});
}
