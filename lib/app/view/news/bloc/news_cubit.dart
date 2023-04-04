import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/view/news/bloc/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(
    this._noticesRepository,
  ) : super(const NewsState()) {
    fetchData();
  }

  final NoticesRepository _noticesRepository;

  Future<void> fetchData() async {
    List<News> news = await _noticesRepository.getNotices(limit: 0);
    emit(state.copyWith(news: news));
  }
}
