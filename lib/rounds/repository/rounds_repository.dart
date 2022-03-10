import "../../libs.dart";

class RoundRepository {
  final RoundDataProvider provider;
  RoundRepository(this.provider);

  Future<RoundResponse> createRound(RoundInput roundInputs) async {
    return await this.provider.createRound(roundInputs);
  }

  Future<RoundResponse>  updateRound(RoundUpdateModel  update) async {
    return await this.provider.updateRound(update);
  }

  Future<RoundResponse>  activateRound(int roundID)  async {
    return await this.provider.activateRound(roundID);
  }

  Future<RoundResponse>  deactivateRound(int roundID) async {
    return await this.provider.deactivateRound(roundID);
  }
  
}