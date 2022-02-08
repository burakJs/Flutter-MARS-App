import '../../../../../models/top_item.dart';

abstract class TopItemState {
  const TopItemState();
}

class TopItemInitial implements TopItemState {
  const TopItemInitial();
}

class TopItemLoading implements TopItemState {
  const TopItemLoading();
}

class TopItemSuccess implements TopItemState {
  TopItem? topItem;
  TopItemSuccess({this.topItem});
}

class TopItemError implements TopItemState {
  String? error;
  TopItemError({this.error});
}
