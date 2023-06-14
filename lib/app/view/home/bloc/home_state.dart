import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/brand.dart';
import 'package:vemare/app/domain/model/encuesta.dart';
import 'package:vemare/app/domain/model/hero.dart';
import 'package:vemare/app/domain/model/notices.dart';
import 'package:vemare/app/domain/model/category.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/domain/model/workshop.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool loading,
    @Default(false) bool showSurvey,
    @Default(<HeroHome>[]) List<HeroHome> hero,
    @Default(<Category>[]) List<Category> promotions,
    @Default(<Category>[]) List<Category> products,
    @Default(<Services>[]) List<Services> services,
    @Default(<WorkShop>[]) List<WorkShop> workshop,
    @Default(<News>[]) List<News> notices,
    @Default(<Brand>[]) List<Brand> brands,
    Encuestas? encuesta,
    WorkWithUs? workWithUs,
  }) = _HomeState;
  const HomeState._();
}
