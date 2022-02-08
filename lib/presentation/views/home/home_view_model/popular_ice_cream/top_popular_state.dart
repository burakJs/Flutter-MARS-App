import '../../../../../models/top_popular.dart';

abstract class TopPopularState {
  const TopPopularState();
}

class TopPopularInitial implements TopPopularState {
  const TopPopularInitial();
}

class TopPopularLoading implements TopPopularState {
  const TopPopularLoading();
}

class TopPopularSuccess implements TopPopularState {
  List<TopPopular>? topPopular;
  TopPopularSuccess({this.topPopular});
}

class TopPopularError implements TopPopularState {
  String? error;
  TopPopularError({this.error});
}
