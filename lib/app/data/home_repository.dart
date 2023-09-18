import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/hero.dart';
import 'package:vemare/app/domain/model/hero_buttons.dart';

class HomeRepository {
  final MyApiClient _apiClient;

  HomeRepository(this._apiClient);

  Future<List<HeroHome>> getHero() async {
    final dynamic res = await _apiClient.getRequest('$BASE_API_URL/api/hero');
    return (res as List).map(HeroHome.fromJson).toList();
  }

  Future<HeroButtons> getHeroButtons() async {
    final dynamic res =
        await _apiClient.getRequest('$BASE_API_URL/api/hero/buttons');
    return HeroButtons.fromJson(res);
  }

  Future<bool> contactForm(
      {required String email,
      required String subject,
      required String description}) async {
    final dynamic res =
        await _apiClient.postRequest('$BASE_API_URL/api/contact-form', body: {
      "email": email,
      "subject": subject,
      "description": description,
    });
    return (res["response"] as String) == "success";
  }
}
