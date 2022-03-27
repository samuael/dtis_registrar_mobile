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
          : 200,
      // color: Colors.brown,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: 200,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: Text("Full Name"),
                          ),
                          Text(":  "),
                          Text(widget.student.fullname),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Text("Age"),
                        ),
                        Text(":  "),
                        Text("${widget.student.age}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Text("Sex"),
                        ),
                        Text(":  "),
                        Text("${widget.student.sex}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Text("Academic Status"),
                        ),
                        Text(":  "),
                        Text("${widget.student.accademicStatus}"),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: Text("Birth Date"),
                          ),
                          Text(":  "),
                          Text(widget.student.birthDate.toString()),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: Text("Address "),
                          ),
                          Text(":  "),
                          Text(widget.student.address.toString()),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: Text("Phone"),
                          ),
                          Text(":  "),
                          Text(widget.student.phone),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Text("Paid Amount"),
                        ),
                        Text(":  "),
                        Text("${widget.student.paidAmount}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: Text("Registered At"),
                        ),
                        Text(":  "),
                        Text("${widget.student.registeredAt.toString()}"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Card(child :Container(
            child : Text(
              (context.watch<AdminsListBloc>().state is AdminsListLoadSuccess) ? 
              ( ((context.watch<AdminsListBloc>().state as AdminsListLoadSuccess).getAdminByID(widget.student.registeredBy!) != null) ? 
              ((context.watch<AdminsListBloc>().state as AdminsListLoadSuccess).getAdminByID(widget.student.registeredBy!)!.fullname) : "Unknown")  : "Unknown")
          ),), 
        ],
      ),
    );
  }
}
