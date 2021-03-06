import '../../../../../models/top_flavour.dart';

abstract class TopFlavourState {
  const TopFlavourState();
}

class TopFlavourInitial implements TopFlavourState {
  const TopFlavourInitial();
}

class TopFlavourLoading implements TopFlavourState {
  const TopFlavourLoading();
}

class TopFlavourSuccess implements TopFlavourState {
  TopFlavour? flavour;
  TopFlavourSuccess({this.flavour});
}

class TopFlavourError implements TopFlavourState {
  String? error;
  TopFlavourError({this.error});
}
