import "../../libs.dart";

class StudentItem extends StatefulWidget {
  final Student student;
  const StudentItem({required this.student, Key? key}) : super(key: key);

  @override
  State<StudentItem> createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  @override
  Widget build(BuildContext context) {
    print(widget.student.imgurl);
    return ListTile(
        leading: widget.student.imgurl != ""
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
        title: Text(widget.student.fullname),
        subtitle:
            Text("Registered At : ${widget.student.registeredAt.toString()}")
        // trailing: ,
        );
  }
}
