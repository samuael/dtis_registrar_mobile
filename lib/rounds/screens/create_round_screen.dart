import "../../libs.dart";

class CreateRoundScreen extends StatefulWidget {
  static const String RouteName = "CreateRoundFromCategory";
  final int categoryID;
  const CreateRoundScreen(this.categoryID, {Key? key}) : super(key: key);

  @override
  State<CreateRoundScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateRoundScreen> {
  @override
  Widget build(BuildContext context) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    if (!(categoriesBloc.state is CategoriesListSuccess)) {
      return SizedBox();
    }
    final category = (categoriesBloc.state as CategoriesListSuccess)
        .categories
        .firstWhere((element) => element.id == widget.categoryID);
    return AnimatedContainer(
      duration: Duration(
        seconds: 1,
      ),
      color: Colors.black12,
      child: Column(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              child: Container(
                child: Icon(
                  Icons.cancel_sharp,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: Text(
                        "Register Round",
                      ),
                    ),
                    Row(children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Category"),
                      SizedBox(
                        width: 30,
                      ),
                      Text(category.title),
                    ]),
                    Row(children: [
                      Text(
                        "Training Hours",
                      ),

                      // TextField(
                      //     keyboardType: TextInputType.number,

                      //     decoration: InputDecoration(
                      //       hintText: "Training Hours  eg. 30",
                      //     ))
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          // controller: messageController,
                          // decoration: InputDecoration(labelText: " "),

                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).cursorColor,
                          // maxLength: 2000,
                          // maxLines: 3,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.message),
                            labelText: ' Training Hours',
                            labelStyle: TextStyle(
                              color: Color(0xFF006699),
                            ),
                            helperText: "Training Hours  eg. 30",
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text(
                        "Round Number ",
                      ),

                      // TextField(
                      //     keyboardType: TextInputType.number,

                      //     decoration: InputDecoration(
                      //       hintText: "Training Hours  eg. 30",
                      //     ))
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          // controller: messageController,
                          // decoration: InputDecoration(labelText: " "),

                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).cursorColor,
                          // maxLength: 2000,
                          // maxLines: 3,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.message),
                            labelText: ' Round Number ',
                            labelStyle: TextStyle(
                              color: Color(0xFF006699),
                            ),
                            helperText: "Round Number er. 5",
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text(
                        "Starting Date",
                      ),

                      // TextField(
                      //     keyboardType: TextInputType.number,

                      //     decoration: InputDecoration(
                      //       hintText: "Training Hours  eg. 30",
                      //     ))
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          // controller: messageController,
                          // decoration: InputDecoration(labelText: " "),

                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).cursorColor,
                          // maxLength: 2000,
                          // maxLines: 3,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.message),
                            labelText: ' Starting Date',
                            labelStyle: TextStyle(
                              color: Color(0xFF006699),
                            ),
                            helperText: "Starting Date  eg. 5/6/2014",
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text(
                        "End Date       ",
                      ),

                      // TextField(
                      //     keyboardType: TextInputType.number,

                      //     decoration: InputDecoration(
                      //       hintText: "Training Hours  eg. 30",
                      //     ))
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          // controller: messageController,
                          // decoration: InputDecoration(labelText: " "),

                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).cursorColor,
                          // maxLength: 2000,
                          // maxLines: 3,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.message),
                            labelText: ' End Date ',
                            labelStyle: TextStyle(
                              color: Color(0xFF006699),
                            ),
                            helperText: "End Date  eg. 5/6/2014",
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Text(
                        "Language       ",
                      ),

                      // TextField(
                      //     keyboardType: TextInputType.number,

                      //     decoration: InputDecoration(
                      //       hintText: "Training Hours  eg. 30",
                      //     ))
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                          // width: 150,
                          child: DropdownButton(
                            // onChanged: 
                        disabledHint: Text("Languages"),
                        autofocus: true,
                        value: 1,
                        // selectedItemBuilder: (context){
                        //   return Text("samuael",);
                        // },
                        items: [
                          DropdownMenuItem(
                              value: 1,
                              onTap: () {},
                              child: Text(
                                "samuael",
                              ),),
                          DropdownMenuItem(
                              value: 2,
                              onTap: () {},
                              child: Text(
                                "adnew",
                              ),),
                          DropdownMenuItem(
                              value: 3,
                              onTap: () {},
                              child: Text(
                                "birhane",
                              ),),
                        ],
                      )),
                    ]),
                    Row(children: [
                      Text(
                        "End Date       ",
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).cursorColor,
                          // maxLength: 2000,
                          // maxLines: 3,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.message),
                            labelText: ' End Date ',
                            labelStyle: TextStyle(
                              color: Color(0xFF006699),
                            ),
                            helperText: "End Date  eg. 5/6/2014",
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
