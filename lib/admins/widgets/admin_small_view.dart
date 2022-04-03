import "../../libs.dart";

class AdminSmallView extends StatelessWidget {
  final Admin admin;
  final AdminActionType type;
  const AdminSmallView(this.admin, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 80,
                    width: 80,
                    child: admin.imgurl != ""
                        ? Image.network(
                            StaticDataStore.SCHEME +
                                StaticDataStore.HOST +
                                ":${StaticDataStore.PORT}/" +
                                admin.imgurl.trim(),
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            "assets/icon_images/manam.png",
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${admin.fullname}",
                      ),
                    ],
                  ),
                ]),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 20,
                    width: 110,
                    color: admin.superadmin ? Colors.blue : Colors.blueGrey,
                    child: Row(
                      children: [
                        Icon(
                          admin.superadmin ? Icons.check : Icons.circle,
                          color: Colors.white,
                        ),
                        Text(
                          admin.superadmin ? "Admin" : "Secretary",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: Text(
                  type == AdminActionType.registration
                      ? "Registered By"
                      : (type == AdminActionType.approval
                          ? " Approved By"
                          : ""),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
