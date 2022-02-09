import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/init/base_models/error_response_model.dart';
import '../../../../models/top_flavour.dart';
import 'repositories/ITop_flavour_detail_repository.dart';
import 'top_flavour_detail_state.dart';

class TopFlavourDetailCubit extends Cubit<TopFlavourDetailState> {
  TopFlavourDetailCubit({required this.repository}) : super(TopFlavourDetailInitial());

  final ITopFlavourDetailRepository repository;
  var kilo = 1;

  void setLike(TopFlavour topFlavour) {
    emit(TopFlavourDetailLoading());
    var result = repository.setLike(topFlavour);
    if (result.isSuccess) {
      emit(TopFlavourDetailSuccess(topFlavour: topFlavour));
    } else {
      emit(TopFlavourDetailError(error: (result as ErrorResponseModel).error));
    }
  }

  void setKilos(bool isAdd) {
    emit(TopFlavourDetailLoading());
    kilo = repository.setKilos(kilo, isAdd);
    emit(TopFlavourDetailSuccess(kilos: kilo));
  }
}
