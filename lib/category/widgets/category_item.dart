import 'dart:io';
import "dart:ui" as ui;
import "../../libs.dart";
import 'package:file_picker/file_picker.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  const CategoryItem({required this.category, Key? key}) : super(key: key);

  @override
  CategoryItemState createState() {
    return CategoryItemState();
  }
}

class CategoryItemState extends State<CategoryItem> {
  double elevation = 8;
  double _imageSelectOpacity = 0.2;
  double _paddingLeft = 200;

  Future<void> uploadImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      // context.read<CategoriesBloc>().add(UploadCategoryProfilEvent());
      final response = await context
          .read<CategoriesBloc>()
          .uploadCategoryPicture(file, this.widget.category.id);

      if ((response).imgurl != "") {
        context
            .read<CategoriesBloc>()
            .add(UploadCategoryProfilEvent((response).imgurl, response.id));
      } else {
        final snackBar = SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: Text(response.msg!,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'Retry',
            onPressed: () {
              uploadImage(context);
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(StaticDataStore.SCHEME+StaticDataStore.HOST+":${StaticDataStore.PORT}/"+widget.category.imgurl);
    return MouseRegion(
      onEnter: (point) {
        setState(() {
          this.elevation = 4;
        });
      },
      onExit: (point) {
        setState(() {
          this.elevation = 8;
        });
      },
      child: SafeArea(
        right: true,
        left: true,
        top: true,
        bottom: false,
        child: Card(
          elevation: this.elevation,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(CategoriesScreen.RouteName,
                  arguments: {"category": this.widget.category});
            },
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Container(
                          width: ui.window.physicalSize.width > 1900
                              ? (ui.window.physicalSize.width / 4) * .75
                              : (ui.window.physicalSize.width < 1900 &&
                                      ui.window.physicalSize.width > 1000
                                  ? (ui.window.physicalSize.width / 3) * .75
                                  : MediaQuery.of(context).size.width * 0.75),
                          child: widget.category.imgurl == ""
                              ? Image.asset(
                                  "assets/images/car-middle.gif",
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                StaticDataStore.SCHEME+StaticDataStore.HOST+":${StaticDataStore.PORT}/"+widget.category.imgurl,
                                fit: BoxFit.fill,
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: MouseRegion(
                            onEnter: (ptr) {
                              setState(() {
                                _imageSelectOpacity = 0.8;
                                _paddingLeft = 220;
                              });
                            },
                            onExit: (prt) {
                              setState(() {
                                _imageSelectOpacity = 0.2;
                                _paddingLeft = 200;
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  uploadImage(context);
                                });
                              },
                              child: AnimatedOpacity(
                                opacity: _imageSelectOpacity,
                                duration: Duration(milliseconds: 500),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  padding: EdgeInsets.only(left: _paddingLeft),
                                  color: Colors.black,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
                                widget.category.shortTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Moms TypeWriter",
                                ),
                              ),
                              Text(
                                widget.category.title,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
