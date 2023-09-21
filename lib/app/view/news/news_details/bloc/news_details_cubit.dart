import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/notices_repository.dart';

import 'news_details_state.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsState> {
  NewsDetailsCubit(
    this._noticesRepository,
    String? id,
  ) : super(NewsDetailsState(id: id)) {
    fetchData();
  }

  final NoticesRepository _noticesRepository;

  Future<void> fetchData() async {
    var news = await _noticesRepository.getNoticesDetails(state.id!);
    emit(state.copyWith(
      details: news,
    ));
  }
}
