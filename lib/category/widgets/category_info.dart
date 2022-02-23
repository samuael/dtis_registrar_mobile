import "../../libs.dart";

class CategoryInfo extends StatefulWidget {
  final Category category;
  const CategoryInfo({required this.category, Key? key}) : super(key: key);

  @override
  _CategoryInfoState createState() => _CategoryInfoState();
}

class _CategoryInfoState extends State<CategoryInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        color: Colors.white,
        width: double.infinity,
        child: Row(children: [
          Container(),
        ]));
  }
}
