import "../../libs.dart";

class StudentView extends StatefulWidget {
  final Student student;
  const StudentView(this.student, {Key? key}) : super(key: key);

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          (context.read<DragShowInfoBloc>().state ? 0.6 : 0.9),
      width: getDeviceType() == DeviceType.Phone
          ? MediaQuery.of(context).size.width * 0.8
          : 450,
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      color : Theme.of(context).canvasColor , 
      // color: Colors.brown,
      child: Column(
        children: [
          Row(
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                width: 275,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            child: Text(
                          "Full Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(":  "),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(widget.student.fullname),
                      ),
                    ]),
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
                          child: Text("${widget.student.sex}"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Text(
                              "Academic \nStatus",
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
                          child: Text("${widget.student.accademicStatus}"),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        child: Text(
                          widget.student.birthDate.toString(),
                        ),
                      ),
                    ]),
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
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        child: Text(widget.student.phone),
                      ),
                    ]),
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
                          child:
                              Text("${widget.student.registeredAt.toString()}"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
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
