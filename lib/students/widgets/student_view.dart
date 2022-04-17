import "../../libs.dart";

class StudentView extends StatefulWidget {
  final Student student;
  const StudentView(this.student, {Key? key}) : super(key: key);

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  bool editStudent = false;
  bool visibleImageSelection = false;
  bool isHovering = false;

  String selectedValue = "Male";

  TextEditingController academicStatusController = TextEditingController();
  // TextEditingController  acadamicStatusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height *
      //     (context.read<DragShowInfoBloc>().state ? 0.6 : 0.9),
      width: getDeviceType() == DeviceType.Phone
          ? MediaQuery.of(context).size.width * 0.8
          : 450,
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      color: Theme.of(context).canvasColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  MouseRegion(
                    onEnter: (a) {
                      if (!isHovering) {
                        setState(() {
                          this.isHovering = true;
                        });
                      }
                    },
                    onExit: (a) {
                      if (isHovering) {
                        setState(() {
                          this.isHovering = false;
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.symmetric(
                              vertical: BorderSide(style: BorderStyle.solid),
                              horizontal: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                          child: widget.student.imgurl != ""
                              ? Image.network(
                                  StaticDataStore.SCHEME +
                                      StaticDataStore.HOST +
                                      ":${StaticDataStore.PORT}/" +
                                      widget.student.imgurl,
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  widget.student.sex == "F"
                                      ? "assets/icon_images/wonam.png"
                                      : "assets/icon_images/manam.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Positioned(
                          child: AnimatedOpacity(
                            opacity: isHovering ? 0.8 : 0,
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              width: 150,
                              color: Colors.black45,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          bottom: 10,
                          right: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    width: 340,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Text(
                                  "Full Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":  "),
                            ),
                            Expanded(
                              flex: 5,
                              child: editStudent
                                  ? Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          width: 350,
                                          height: 30,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                Theme.of(context).cursorColor,
                                            // controller: paymentAmountController,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                  color: Colors
                                                      .red, // : Colors.teal,
                                                ),
                                              ),
                                              labelText: ' Firstname ',
                                              labelStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor, // : Color(0xFF006699),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          width: 350,
                                          height: 30,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                Theme.of(context).cursorColor,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                  color: Colors
                                                      .red, // : Colors.teal,
                                                ),
                                              ),
                                              labelText: ' Lastname ',
                                              labelStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor, // : Color(0xFF006699),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          width: 400,
                                          height: 30,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                Theme.of(context).cursorColor,
                                            // controller: paymentAmountController,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              border: new OutlineInputBorder(
                                                borderSide: new BorderSide(
                                                  color: Colors
                                                      .red, // : Colors.teal,
                                                ),
                                              ),
                                              labelText: ' Surname ',
                                              labelStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor, // : Color(0xFF006699),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Text(widget.student.fullname),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Text(
                                  "Age",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":  "),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text("${widget.student.age}"),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Text(
                                  "Sex",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":  "),
                            ),
                            Expanded(
                              flex: 5,
                              child: editStudent
                                  ? Container(
                                      height: 30,
                                      width: 30,
                                      child: DropdownButton<String>(
                                        value: selectedValue,
                                        items: <String>['Male', 'Female']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          if (value != null) {
                                            setState(() {
                                              this.selectedValue = value;
                                            });
                                          }
                                        },
                                        selectedItemBuilder:
                                            (BuildContext context) {
                                          return <String>['Male', 'Female']
                                              .map<Widget>((String item) {
                                            return Text(
                                              item,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            );
                                          }).toList();
                                        },
                                        autofocus: true,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  : Text("${widget.student.sex}"),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  "Academic\nStatus",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":  "),
                            ),
                            Expanded(
                              flex: 6,
                              child: editStudent
                                  ? Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      width: 400,
                                      height: 30,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            Theme.of(context).cursorColor,
                                        autofocus: true,
                                        decoration: InputDecoration(
                                          border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                              color:
                                                  Colors.red, // : Colors.teal,
                                            ),
                                          ),
                                          labelText: "Academic Status",
                                          labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor, // : Color(0xFF006699),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text("${widget.student.accademicStatus}"),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text(
                                    "Birth Date",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(":  "),
                              ),
                              Expanded(
                                flex: 5,
                                child: editStudent
                                    ? SizedBox()
                                    : Text(
                                        widget.student.birthDate
                                            .toLimitedString(),
                                      ),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: Text(
                                  "Address:",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            AddressSmallView(widget.student.address),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  child: Text(
                                    "Phone",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":  "),
                            ),
                            Expanded(
                              flex: 5,
                              child: editStudent
                                  ? Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      width: 400,
                                      height: 30,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            Theme.of(context).cursorColor,
                                        autofocus: true,
                                        decoration: InputDecoration(
                                          border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                              color:
                                                  Colors.red, // : Colors.teal,
                                            ),
                                          ),
                                          labelText: " Phone ",
                                          labelStyle: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor, // : Color(0xFF006699),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(widget.student.phone),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: 100,
                                child: Text(
                                  "Paid Amount",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":  "),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text("${widget.student.paidAmount}"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Text(
                                  "Registeration\n Date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":  "),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text(
                                  "${widget.student.registeredAt.toString()}"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: AnimatedOpacity(
                        duration: Duration(seconds: 2),
                        opacity: this.editStudent ? 1 : 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Save Change",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.save_sharp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        this.editStudent ? Icons.edit_off_rounded : Icons.edit,
                        color: this.editStudent
                            ? Colors.red
                            : Theme.of(context).primaryColor,
                      ),
                      onTap: () {
                        setState(() {
                          editStudent = !editStudent;
                        });
                      },
                    ),
                  ],
                ),
                top: 0,
                right: 10,
              ),
            ],
          ),
          (context.watch<AdminsListBloc>().state is AdminsListLoadSuccess)
              ? (((context.watch<AdminsListBloc>().state
                              as AdminsListLoadSuccess)
                          .getAdminByID(widget.student.registeredBy!) !=
                      null)
                  ? AdminSmallView(
                      (context.watch<AdminsListBloc>().state
                              as AdminsListLoadSuccess)
                          .getAdminByID(widget.student.registeredBy!)!,
                      AdminActionType.registration)
                  : CircularProgressIndicator())
              : CircularProgressIndicator(),

          // ----------Round Information
          ((context.watch<CategoriesBloc>().state is CategoriesListSuccess) &&
                  (context.watch<CategoriesBloc>().state
                              as CategoriesListSuccess)
                          .getRoundByID(widget.student.roundID) !=
                      null)
              ? RoundSmallView((context.watch<CategoriesBloc>().state
                      as CategoriesListSuccess)
                  .getRoundByID(widget.student.roundID)!)
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
