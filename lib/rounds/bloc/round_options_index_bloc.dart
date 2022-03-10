import "../../libs.dart";


class RoundOptionsIndexBloc extends Bloc<int , int > implements Cubit<int >{
  RoundOptionsIndexBloc() : super(0);
  
  @override 
  Stream<int >  mapEventToState(int event ) async*{
    yield event;
  }

}