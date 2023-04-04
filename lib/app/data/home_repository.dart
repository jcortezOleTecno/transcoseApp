import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/hero.dart';

class HomeRepository {
  final MyApiClient _apiClient;

  HomeRepository(this._apiClient);

  Future<List<HeroHome>> getHero() async {
    final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/hero');
    return (res as List).map(HeroHome.fromJson).toList();
  }
}
