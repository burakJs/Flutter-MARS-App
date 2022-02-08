import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/top_popular.dart';
import 'repositories/IPopular_repository.dart';
import 'top_popular_state.dart';

class TopPopularCubit extends Cubit<TopPopularState> {
  TopPopularCubit({required this.repository}) : super(const TopPopularInitial());

  final IPopularRepository repository;

  Future<void> getTopPopular() async {
    emit(const TopPopularLoading());

    var response = await repository.getPopularIceCreams();
    List<TopPopular> popularList = (response?['popular_list'] as List).map((e) => TopPopular.fromJson(e)).toList();
    emit(TopPopularSuccess(topPopular: popularList));
  }
}
