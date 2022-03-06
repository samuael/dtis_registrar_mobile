import "../../libs.dart";

class CategoryOptionIndexBloc extends Bloc<int, int> {
  CategoryOptionIndexBloc() : super(0);

  @override
  Stream<int> mapEventToState(int event) async* {
    if (event >= 0 && event <= 5) {
      yield event;
    }
  }
}
