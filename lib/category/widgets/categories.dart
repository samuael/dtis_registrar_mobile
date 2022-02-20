import '../../libs.dart';
import "dart:ui" as ui;

class CategoryLists extends StatefulWidget {
  const CategoryLists({Key? key}) : super(key: key);

  @override
  _CategoryListsState createState() => _CategoryListsState();
}

class _CategoryListsState extends State<CategoryLists> {
  bool addCategory = false;

  @override
  Widget build(BuildContext context) {
    
    return Container(
        child: SafeArea(
      child: Stack(
        children: [
          BlocBuilder<CategoriesBloc, CategoryBlocState >(
            
            builder: (context , state){
              
              if( state is Category ){
                return GridView.count(
                  crossAxisCount: StaticDataStore.DType == DeviceType.Desktop
                      ? 4
                      : StaticDataStore.DType == DeviceType.Tablet
                          ? 2
                          : 1,
                  children: [
                    CategoryItem(category:categories[0]),
                    CategoryItem(category:categories[1]),
                    CategoryItem(category:categories[2]),
                    CategoryItem(category:categories[3]),
                    CategoryItem(category:categories[0]),
                  ],
                );
              }
            }
          ) , 
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
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  addCategory = !addCategory;
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
    ));
  }
}