import "../../libs.dart";

class RoundRepository {
  final RoundDataProvider provider;
  RoundRepository(this.provider);

  Future<RoundResponse> createRound(RoundInput roundInputs) async {
    return await this.provider.createRound(roundInputs);
  }
  
}