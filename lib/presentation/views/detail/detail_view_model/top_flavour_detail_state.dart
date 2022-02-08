import '../../../../models/top_flavour.dart';

abstract class TopFlavourDetailState {
  TopFlavourDetailState();
}

class TopFlavourDetailInitial extends TopFlavourDetailState {
  TopFlavourDetailInitial();
}

class TopFlavourDetailLoading extends TopFlavourDetailState {
  TopFlavourDetailLoading();
}

class TopFlavourDetailSuccess extends TopFlavourDetailState {
  TopFlavour? topFlavour;
  int? kilos;
  TopFlavourDetailSuccess({this.topFlavour, this.kilos});
}

class TopFlavourDetailError extends TopFlavourDetailState {
  String? error;
  TopFlavourDetailError({this.error});
}
