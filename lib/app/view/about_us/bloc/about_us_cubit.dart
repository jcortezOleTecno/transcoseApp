import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/library_repository.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/data/pills_repository.dart';
import 'package:vemare/app/domain/model/library.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/pills.dart';
import 'package:vemare/app/view/about_us/bloc/about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(
    this._libraryRepository,
    this._pillsRepository,
    this._noticesRepository,
  ) : super(const AboutUsState()) {
    fetchData();
  }

  final LibraryRepository _libraryRepository;
  final PillsRepository _pillsRepository;
  final NoticesRepository _noticesRepository;

  Future<void> fetchData() async {
    List<Library> libraries = [];
    List<Pills> pills = [];
    List<News> news = [];

    await Future.wait([
      _libraryRepository.getLibraries(limit: 2).then((v) => libraries = v),
      _pillsRepository.getPills(limit: 2).then((v) => pills = v),
      _noticesRepository.getNotices().then((v) => news = v),
    ]);

    emit(state.copyWith(
      libraries: libraries,
      pills: pills,
      news: news,
    ));
  }
}
