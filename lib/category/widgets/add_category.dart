import "../../libs.dart";
import 'package:image_picker/image_picker.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  // TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController shortTitleController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  XFile? categoryImage;
  String createCategoryMessage = "";
  Color categoryCreateMessageColor = Colors.white;
  double _dpadding = 1;

  @override
  Widget build(BuildContext context) {
    CategoriesBloc categoriesBloc = BlocProvider.of<CategoriesBloc>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Create Category ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Moms TypeWriter",
                    fontSize: 24,
                  ),
                ),
              ),

              AnimatedContainer(
                duration: Duration(seconds: 1),
                padding: EdgeInsets.all(_dpadding),
                child: Text(
                  createCategoryMessage,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Elegant TypeWriter-Bold",
                    color: categoryCreateMessageColor,
                  ),
                ),
              ),
              TextField(
                cursorColor: Theme.of(context).primaryColorLight,
                controller: titleController,
                decoration: InputDecoration(
                  labelText: " Title ",
                  fillColor: Colors.lightBlue,
                  hoverColor: Colors.lightBlue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
              TextField(
                cursorColor: Theme.of(context).primaryColorLight,
                controller: shortTitleController,
                decoration: InputDecoration(
                  labelText: "Short Title",
                  fillColor: Colors.lightBlue,
                  hoverColor: Colors.lightBlue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    " Select Image : ",
                    style: TextStyle(
                      fontFamily: "Elegant TypeWriter",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();

                      // final files = await picker.pickImage(source: ImageSource.gallery);
                      picker.pickMultiImage();
                      // if (files != null ){
                      //   print("The Image is selected!");
                      // }
                    },
                    icon: Icon(
                      Icons.image,
                      size: 45,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    // backgroundColor: MaterialColor<Color?>(Theme.of(context).primaryColor),
                    ),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final title = titleController.text.trim();
                  final shortTitle = shortTitleController.text.trim();
                  this.createCategoryMessage = "";
                  this.categoryCreateMessageColor = Colors.white;
                  setState(() {
                    this._dpadding = 0;
                  });
                  if (title != "" && shortTitle != "") {
                    Category cat = Category(
                      title: title,
                      shortTitle: shortTitle,
                      numberOfRounds: 0,
                      createdAt: Date(), 
                    );
                    if (categoryImage == null) {
                      final result =
                          await categoriesBloc.createCategoryWithOutImage(
                              CategoryCreateWithOutImageEvent(cat));

                      this.createCategoryMessage = "${result.message}\n\r" +
                          " [[ " +
                          (STATUS_CODES[result.code] ?? " Internal Problem ") +
                          " ]] ";

                      if ((result.code == 201 || result.code == 200) &&
                          result.category != null) {
                        setState(() {
                          this.categoryCreateMessageColor = Colors.green;
                          categoriesBloc
                              .add(AddCategoryEvent(result.category!));
                          this.titleController.text = "";
                          this.shortTitleController.text = "";
                        });
                      } else {
                        setState(() {
                          this.categoryCreateMessageColor = Colors.red;
                        });
                      }
                    } else {
                      categoriesBloc.add(
                          CategoryCreateWithImageEvent(cat, categoryImage!));
                    }
                  } else if (title == "" && shortTitle == "") {
                    setState(() {
                      this.createCategoryMessage = "please fille the entries ";
                      this.categoryCreateMessageColor = Colors.red;
                    });
                  } else if (title == "") {
                    setState(() {
                      this.createCategoryMessage = "please fill the title";
                      this.categoryCreateMessageColor = Colors.red;
                    });
                  } else if (shortTitle == "") {
                    setState(() {
                      this.createCategoryMessage =
                          "fill the shorter form of title";
                      this.categoryCreateMessageColor = Colors.red;
                    });
                  }
                  setState(() {
                    this._dpadding = 1;
                  });
                },
                label: Text(
                  " Add ",
                  style: TextStyle(
                    fontFamily: "Elegant TypeWriter-Bold",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
