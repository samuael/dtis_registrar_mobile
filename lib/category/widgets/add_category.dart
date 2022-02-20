import "../../libs.dart";
import 'package:image_picker/image_picker.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController shortTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  "Add Category ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Moms TypeWriter",
                    fontSize: 24,
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
              TextField(
                cursorColor: Theme.of(context).primaryColorLight,
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Description ",
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
                onPressed: () {},
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
