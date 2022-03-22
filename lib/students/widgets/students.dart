import "../../libs.dart";

class RoundStudents extends StatefulWidget {
  int roundID;
  RoundStudents({required this.roundID, Key? key}) : super(key: key);

  @override
  State<RoundStudents> createState() => _RoundStudentsState();
}

class _RoundStudentsState extends State<RoundStudents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<RoundStudentsBloc, RoundStudentsState>(
          builder: (context, state) {
        if (state is RoundStudentsLoaded) {
          if (state.roundStudents[widget.roundID] != null) {
            return Column(children: [
              ...(state.roundStudents[widget.roundID] ?? [])
                  .map<StudentItem>((stu) {
                return StudentItem(student: stu);
              }).toList(),
              FlatButton.icon(
                  icon: Icon(Icons.model_training_rounded),
                  label: Text(
                    "See More",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    context
                        .read<RoundStudentsBloc>()
                        .add(RoundStudentsLoadEvent(widget.roundID));
                  } , 
                   minWidth: 50,
                   height: 40,
                  focusColor: Theme.of(context).primaryColorLight,
                  )
            ]);
          } else {
            return Center(
                child: GestureDetector(
              onTap: () {
                context
                    .read<RoundStudentsBloc>()
                    .add(RoundStudentsLoadEvent(widget.roundID));
              },
              child: Icon(
                Icons.threesixty_sharp,
                color: Theme.of(context).primaryColor,
              ),
            ));
          }
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
