import '../../libs.dart';

class RoundsBloc extends Bloc<RoundEvents, RoundBlocState>
    implements Cubit<RoundBlocState> {
  RoundsBloc(RoundInit initialState) : super(initialState);
  RoundRepository repository = RoundRepository(RoundDataProvider());

  @override
  Stream<RoundBlocState> mapEventToState(RoundEvents event) async* {
    // --- |
  }
  
  Future<RoundResponse>  createRound(RoundInput input) async {
    return await this.repository.createRound(input);
  }  

  Future<RoundResponse>  updateRound(RoundUpdateModel  update) async {
    return await this.repository.updateRound(update);
  }

  Future<RoundResponse>  activateRound(int roundID)async {
    return await this.repository.activateRound(roundID);
  }

  Future<RoundResponse> deactivateRound(int roundID) async {
    return await this.repository.deactivateRound(roundID);
  }
  
}
