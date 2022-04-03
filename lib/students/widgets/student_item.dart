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
  bool select = false;
  @override
  Widget build(BuildContext context) {
    final round =
        (context.watch<CategoriesBloc>().state as CategoriesListSuccess)
            .getRoundByID(widget.student.roundID)!;
    return GestureDetector(
      onTap: () {
        widget.setStudentPreview(widget.student);
      },
      onDoubleTap: () {
        Navigator.of(context).pushNamed(StudentDetailScreen.RouteName,
            arguments: {"student": widget.student});
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.student.fullname,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Phone:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.student.phone,
                    ),
                  ],
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Registered At:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.student.registeredAt.toString(),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.grey,
                      child: Row(
                        children: [
                          Text(
                            "Category: ${(context.read<CategoriesBloc>().state is CategoriesListSuccess) ? ((context.read<CategoriesBloc>().state as CategoriesListSuccess).getCategoryByID(round.categoryID) != null ? ((context.read<CategoriesBloc>().state as CategoriesListSuccess).getCategoryByID(round.categoryID)!.title) : ("Unknown")) : "Unknown"}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Round: ${round.roundNumber}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                      value: select,
                      onChanged: (val) {
                        setState(() {
                          this.select = !this.select;
                        });
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
