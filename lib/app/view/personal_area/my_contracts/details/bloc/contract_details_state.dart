import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vemare/app/domain/model/contract_detail.dart';
import 'package:vemare/app/domain/model/contrats.dart';

part 'contract_details_state.freezed.dart';

@freezed
class ContratDetailState with _$ContratDetailState {
  const factory ContratDetailState({
    @Default(false) bool loading,
    ContratDetail? detail,
    Contrats? contract,
  }) = _ContratDetailState;
}
