import "../../libs.dart";

class RoundStudentsBloc extends Bloc<RoundStudentsEvent,
    RoundStudentsState> /*  implements Cubit<RoundStudentsState> */ {
  StudentRepository repo = StudentRepository();

  RoundStudentsBloc() : super(RoundStudentsInit());

  @override
  Stream<RoundStudentsState> mapEventToState(RoundStudentsEvent event) async* {
    if (event is RoundStudentsLoadEvent) {
      int roundStudents = 0;
      if (this.state is RoundStudentsLoaded) {
        final students =
            (this.state as RoundStudentsLoaded).roundStudents[event.roundID];
        if (students != null) {
          roundStudents = students.length;
        }
      }
      final result = await repo.getListOfRoundStudents(
          event.roundID, roundStudents, roundStudents + 10);

      if (result.statusCode == 200) {
        print(
            "\n\n\n\n\n\n\n The Number of Students Found : ${result.students!.length}\n\n\n\n\n");
        if (this.state is RoundStudentsLoaded) {
          print("Printing the IF");

          final states = this.state;
          if ((states as RoundStudentsLoaded).roundStudents[result.roundid] ==
              null) {
            (states).roundStudents[result.roundid] = [];
          }
          ((states).roundStudents[result.roundid]!)
              .addAll(result.students ?? []);
          final stids = Map<int, bool>();
          (states).roundStudents[result.roundid]!.removeWhere((element) {
            if (stids[element.id ?? 0] != null &&
                stids[element.id ?? 0] == true) {
              return true;
            }
            stids[element.id ?? 0] = true;
            return false;
          });
          print("LENGTH: ${states.roundStudents[result.roundid] ?? [].length}");
          yield RoundStudentsInit();
          yield states;
        } else {
          print("Printing the Else");
          yield RoundStudentsLoaded(
              roundStudents: {result.roundid: result.students ?? []});
        }
      } else if (result.statusCode == 404) {
        if (this.state is RoundStudentsLoaded) {
          final states = this.state;
          ((states as RoundStudentsLoaded).roundStudents[result.roundid] ?? [])
              .addAll(result.students ?? []);
          yield states;
        } else {
          yield RoundStudentsLoaded(
              roundStudents: {result.roundid: result.students ?? []});
        }
      }
    }
  }
}
