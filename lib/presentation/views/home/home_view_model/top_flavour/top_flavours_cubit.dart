import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_project/models/top_flavour.dart';

import '../top_flavour/top_flavour_state.dart';
import 'repositories/IFlavour_repository.dart';
import 'repositories/flavour_repository.dart';

class TopFlavourCubit extends Cubit<TopFlavourState> {
  TopFlavourCubit({IFlavourRepository? repository})
      : _repository = repository ?? FlavourRepository(),
        super(const TopFlavourInitial());

  final IFlavourRepository _repository;

  void getTopFlavour() {
    emit(const TopFlavourLoading());

    var response = _repository.getTopFlavour();
    emit(TopFlavourSuccess(topFlavour: response));
  }
}
