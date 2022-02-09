import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/top_flavour.dart';
import '../top_flavour/top_flavour_state.dart';
import 'repositories/IFlavour_repository.dart';

class TopFlavourCubit extends Cubit<TopFlavourState> {
  TopFlavourCubit({required this.repository}) : super(const TopFlavourInitial());

  final IFlavourRepository repository;

  Future<void> getTopFlavour() async {
    emit(const TopFlavourLoading());

    var response = await repository.getTopFlavour();
    var model = TopFlavour.fromJson(response ?? TopFlavour.baseModel.toJson());
    emit(TopFlavourSuccess(flavour: model));
  }
}
