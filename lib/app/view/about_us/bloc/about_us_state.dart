import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/library.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/pills.dart';

part 'about_us_state.freezed.dart';

@freezed
class AboutUsState with _$AboutUsState {
  const factory AboutUsState({
    @Default(<Library>[]) List<Library> libraries,
    @Default(<Pills>[]) List<Pills> pills,
    @Default(<News>[]) List<News> news,
  }) = _AboutUsState;
  const AboutUsState._();
}
