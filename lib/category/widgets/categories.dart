import '../../libs.dart';
import "dart:ui" as ui;

class CategoryLists extends StatefulWidget {
  const CategoryLists({Key? key}) : super(key: key);

  @override
  _CategoryListsState createState() => _CategoryListsState();
}

class _CategoryListsState extends State<CategoryLists> {
  bool addCategory = false;
  String createCategoryCommand = "Create ";
  double labelOpacity = 0.5;

  CategoriesBloc? categoriesBloc;
  @override
  Widget build(BuildContext context) {
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    if (!(categoriesBloc!.state is CategoriesListSuccess)) {
      categoriesBloc!.add(CategoriesLoadEvent());
    }
    return Container(
        child: SafeArea(
      child: Stack(
        children: [
          BlocBuilder<CategoriesBloc, CategoryBlocState>(
            builder: (context, state) {
              if (state is CategoriesListSuccess) {
                return GridView.count(
                  crossAxisCount: StaticDataStore.DType == DeviceType.Desktop
                      ? 4
                      : StaticDataStore.DType == DeviceType.Tablet
                          ? 2
                          : 1,
                  children: state.categories
                      .map(
                        (el) => CategoryItem(
                          category: el,
                        ),
                      )
                      .toList(),
                );
              } else if (state is CategoriesLoadFailed) {
                return Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            print("calling the load  categories");
                            categoriesBloc!.add(CategoriesLoadEvent());
                          },
                          iconSize: 40,
                        ),
                        Text(
                          "can't load the categories, please try again",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          addCategory
              ? Positioned(
                  right: 20,
                  bottom: 20,
                  child: Container(
                    width: StaticDataStore.DType == DeviceType.Desktop
                        ? (ui.window.physicalSize.width / 2) * .7
                        : MediaQuery.of(context).size.width * .8,
                    child: addCategory ? AddCategoryScreen() : SizedBox(),
                  ),
                )
              : SizedBox(),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: labelOpacity,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds:500),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 7),
                        color: Theme.of(context).primaryColor,
                        child: Text(createCategoryCommand,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Elegant TypeWriter",
                              color: Colors.white,
                              fontSize: 25,
                            )),
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (pointer) {
                    setState(() {
                      labelOpacity = 1;
                    });
                  },
                  onExit: (pointer) {
                    setState(() {
                      labelOpacity = 0.5;
                    });
                  },
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        addCategory = !addCategory;
                        if (!addCategory) {
                          createCategoryCommand = "Create ";
                        } else {
                          createCategoryCommand = "Close";
                        }
                      });
                    },
                    child: Icon(
                      addCategory ? Icons.close : Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
