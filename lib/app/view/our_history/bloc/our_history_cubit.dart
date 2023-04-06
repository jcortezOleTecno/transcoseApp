import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/about_us_repository.dart';
import 'package:vemare/app/domain/model/article_abou_us.dart';
import 'package:vemare/app/view/our_history/bloc/our_history_state.dart';

class OurHistoryCubit extends Cubit<OurHistoryState> {
  OurHistoryCubit(
    this._aboutUsRepository,
  ) : super(const OurHistoryState()) {
    fetchData();
  }

  final AboutUsRepository _aboutUsRepository;

  Future<void> fetchData() async {
    List<ArticleAboutUs> articles = await _aboutUsRepository.getArticles();
    emit(state.copyWith(articles: articles));
  }
}
