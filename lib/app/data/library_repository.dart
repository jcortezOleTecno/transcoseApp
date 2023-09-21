import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/library.dart';

import '../domain/model/article_library_details.dart';

class LibraryRepository {
  final MyApiClient _apiClient;

  LibraryRepository(this._apiClient);

  Future<LibraryResponse> getLibraries({required int limit}) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/articulos',
        params: <String, dynamic>{'limit': '$limit'});
    return LibraryResponse(
      library: (res["data"] as List).map(Library.fromJson).toList(),
      mostRead: (res["most_read"] as List).map(Library.fromJson).toList(),
    );
  }

  Future<ArticleLibraryDetails> getDetails(String id) async {
    final dynamic res = await _apiClient.getRequest(
        '$BASE_API_URL/api/articulos/detalle',
        params: <String, dynamic>{'id': id});
    return ArticleLibraryDetails.fromJson(res);
  }
}

class LibraryResponse {
  final List<Library> mostRead;
  final List<Library> library;

  LibraryResponse({required this.mostRead, required this.library});
}
