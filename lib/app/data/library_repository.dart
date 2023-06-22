import 'package:vemare/app/data/_api_classes.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/model/library.dart';

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
}

class LibraryResponse {
  final List<Library> mostRead;
  final List<Library> library;

  LibraryResponse({required this.mostRead, required this.library});
}
