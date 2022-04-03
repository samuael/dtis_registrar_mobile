import "../../libs.dart";

class RoundSmallView extends StatelessWidget {
  final Round round;
  const RoundSmallView(this.round, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("  : "),
                      Text(
                          "${(context.read<CategoriesBloc>().state is CategoriesListSuccess) ? ((context.read<CategoriesBloc>().state as CategoriesListSuccess).getCategoryByID(round.categoryID) != null ? ((context.read<CategoriesBloc>().state as CategoriesListSuccess).getCategoryByID(round.categoryID)!.title) : ("Unknown")) : "Unknown"}")
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Round Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("  : "),
                      Text("${round.roundNumber}")
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Round Cost",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("  : "),
                      Text("${round.fee}")
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Number of Students",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("  : "),
                      Text("${round.students}"),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  color: round.active ? Colors.green : Colors.red,
                  child: Row(
                    children: [
                      Icon(
                        round.active ? Icons.check : Icons.offline_pin,
                        color: Colors.white,
                      ),
                      Text("  : "),
                      Text(
                        round.active ? "Active" : "Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
