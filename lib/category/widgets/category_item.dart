import "dart:ui" as ui;
import "../../libs.dart";

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({required this.category , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: true,
      left: true,
      top: true,
      bottom: false,
      child: Card(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: ui.window.physicalSize.width > 1900
                      ? (ui.window.physicalSize.width / 4) * .75
                      : (ui.window.physicalSize.width < 1900 &&
                              ui.window.physicalSize.width > 1000
                          ? (ui.window.physicalSize.width / 3) * .75
                          : MediaQuery.of(context).size.width * 0.75),
                  child: category.imgurl=="" ? Image.asset(
                    "assets/images/BAJAJ-MOTORS-RE-4S-10355_3.jpg",
                  ) : Image.network(category.imgurl),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            category.shortTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Moms TypeWriter",
                            ),
                          ),
                          Text(
                            category.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Elegant TypeWriter",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                        label: Text(
                          "Edit",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
