import "../../libs.dart";

class StudentItem extends StatefulWidget {
  final Student student;
  final Function setStudentPreview;
  const StudentItem(
      {required this.student, required this.setStudentPreview, Key? key})
      : super(key: key);

  @override
  State<StudentItem> createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    print(widget.student.imgurl);
    return GestureDetector(
      onTap: () {
        widget.setStudentPreview(widget.student);
      },
      child: MouseRegion(
        onEnter: (ptr) {
          setState(() {
            this.hovering = true;
          });
        },
        onExit: (ptr) {
          setState(() {
            this.hovering = false;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 6,
          ),
          color: this.hovering ? Colors.white : Colors.white54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment : MainAxisAlignment.spaceAround ,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 80,
                  width: 80,
                  color: this.hovering ? Colors.white : Colors.white54,
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
              ),
              Text(widget.student.fullname),
              Text("Registered At : ${widget.student.registeredAt.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
