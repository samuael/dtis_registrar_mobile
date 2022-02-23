import "../../libs.dart";

class CategoriesDetail extends StatefulWidget {
  final Category category;
  const CategoriesDetail({required this.category, Key? key}) : super(key: key);

  @override
  _CategoriesDetailState createState() => _CategoriesDetailState();
}

class _CategoriesDetailState extends State<CategoriesDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          CategoryInfo(category:widget.category),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.blue,
            width: double.infinity,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.yellow,
            width: double.infinity,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.brown,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
