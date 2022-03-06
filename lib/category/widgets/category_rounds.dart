import "../../libs.dart";

class CategoryRounds extends StatefulWidget {
  final Category category;
  const CategoryRounds({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryRounds> createState() => _CategoryRoundsState();
}

class _CategoryRoundsState extends State<CategoryRounds> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    "Rounds of Category, ${widget.category.title}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Elegant TypeWriter",
                    ),
                  ),
                ),
                // RoundItem(round:dummy_rounds[0]),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ...((this.widget.category.rounds ?? []).length > 0
              ? [
                  ...((this.widget.category.rounds ?? [])
                      .map((e) => RoundItem(round: e))
                      .toList())
                ]
              : [
                  Center(
                    child: Text(
                      "No Round Instance was created",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Elegant TypeWriter",
                      ),
                    ),
                  ),
                ]),
        ],
      ),
    );
  }
}
