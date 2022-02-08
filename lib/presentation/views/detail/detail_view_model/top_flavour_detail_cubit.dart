import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_project/models/top_flavour.dart';
import 'package:mars_project/presentation/views/detail/detail_view_model/repositories/ITop_flavour_detail_repository.dart';

import 'top_flavour_detail_state.dart';

class TopFlavourDetailCubit extends Cubit<TopFlavourDetailState> {
  TopFlavourDetailCubit({required this.repository}) : super(TopFlavourDetailInitial());

  final ITopFlavourDetailRepository repository;

  // Future<TopFlavour> setLike(TopFlavour topFlavour) {
  //   return TopFlavour.baseModel;
  // }
}
