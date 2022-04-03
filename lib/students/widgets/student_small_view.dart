import "../../libs.dart";

class StudentSmallView extends StatelessWidget {
  final Student student;
  StudentSmallView(this.student, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: student.imgurl != ""
                  ? Image.network(
                      StaticDataStore.SCHEME +
                          StaticDataStore.HOST +
                          ":${StaticDataStore.PORT}/" +
                          student.imgurl.trim(),
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      student.sex == "F"
                          ? "assets/icon_images/wonam.png"
                          : "assets/icon_images/manam.png",
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${student.fullname}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "Phone: ${student.phone}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "Paid: ${student.paidAmount} Birr",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
