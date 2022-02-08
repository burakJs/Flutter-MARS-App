import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/top_item.dart';
import '../top_Item/top_item_state.dart';
import 'repositories/ITop_item_repository.dart';

class TopItemCubit extends Cubit<TopItemState> {
  TopItemCubit({required this.repository}) : super(const TopItemInitial());

  final ITopItemRepository repository;

  Future<void> getTopItem() async {
    emit(const TopItemLoading());

    var response = await repository.getTopItem();
    var model = TopItem.fromJson(response ?? TopItem.baseModel.toJson());
    emit(TopItemSuccess(topItem: model));
  }
}
