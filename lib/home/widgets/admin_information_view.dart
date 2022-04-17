import '../../libs.dart';

class UserSideInformationView extends StatefulWidget {
  final Admin admin;
  const UserSideInformationView({required this.admin, Key? key})
      : super(key: key);

  @override
  State<UserSideInformationView> createState() =>
      UserSideInformationViewState();
}

class UserSideInformationViewState extends State<UserSideInformationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColorDark,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        ),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          height: 80,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                          ),
                          child: Container(
                            color: Theme.of(context).primaryColorDark,
                            height: 80,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Theme.of(context).primaryColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                    child: Container(
                      color: Theme.of(context).primaryColorDark,
                      height: 140,
                      width: double.infinity,
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).primaryColorDark,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                            ),
                            child: Container(
                              height: 10,
                              color: Theme.of(context).primaryColor,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Container(
                              height: 10,
                              color: Theme.of(context).primaryColor,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                            ),
                            child: Container(
                              height: 10,
                              color: Theme.of(context).primaryColor,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 80,
                    width: 80,
                    child: widget.admin.imgurl != ""
                        ? Image.network(
                            StaticDataStore.SCHEME +
                                StaticDataStore.HOST +
                                ":${StaticDataStore.PORT}/" +
                                widget.admin.imgurl,
                            fit: BoxFit.fill,
                            errorBuilder: (ctx, a, b) {
                              return Image.asset(
                                "assets/icon_images/manam.png",
                                fit: BoxFit.fill,
                              );
                            },
                          )
                        : Image.asset(
                            "assets/icon_images/manam.png",
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Text(
                  widget.admin.fullname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.admin.email,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
