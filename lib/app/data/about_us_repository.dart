import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/article_abou_us.dart';
import 'package:vemare/app/domain/model/social_networks.dart';

class AboutUsRepository {
  final MyApiClient _apiClient;

  AboutUsRepository(this._apiClient);

  Future<List<ArticleAboutUs>> getArticles() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/sobre_nosotros');
    return (res as List).map(ArticleAboutUs.fromJson).toList();
  }

  Future<RedesSociales> getSocialNetwork() async {
    final dynamic res = await _apiClient
        .getRequest('$BASE_API_URL/api/servicios/redes_sociales');
    return RedesSociales.fromJson(res);
  }
}
