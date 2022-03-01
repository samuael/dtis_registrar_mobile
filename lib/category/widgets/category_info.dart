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
      child: Row(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.black,
            child: widget.category.imgurl == ""
                ? Image.asset(
                    "assets/images/BAJAJ-MOTORS-RE-4S-10355_3.jpg",
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  )
                : Image.network(
                    StaticDataStore.SCHEME +
                        StaticDataStore.HOST +
                        ":${StaticDataStore.PORT}/" +
                        widget.category.imgurl,
                    fit: BoxFit.fill,
                    height: 200,
                    width: 200,
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.center,
              children: [
                SizedBox(height:70), 
                Row(children: [
                  Text("Title :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(
                    width: 50,
                  ),
                  Text("Bajaa",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                ]),
                Row(children: [
                  Text("Title",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text("Bajaa",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                ]),
                Row(children: [
                  Text("Title",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text("Bajaa",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                ]),
                Row(children: [
                  Text("Title",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text("Bajaa",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
