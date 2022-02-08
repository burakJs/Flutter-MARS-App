import 'package:mars_project/models/top_flavour.dart';

abstract class ITopFlavourDetailRepository {
  Future<TopFlavour> setLike(TopFlavour topFlavour);
  void setKilos();
}
