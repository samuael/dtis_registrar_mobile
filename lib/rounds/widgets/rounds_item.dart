import "../../libs.dart";

class RoundItem extends StatefulWidget {
  final Round round;
  const RoundItem({Key? key, required this.round}) : super(key: key);

  @override
  RoundItemState createState() {
    return RoundItemState();
  }
}

class RoundItemState extends State<RoundItem> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RoundsScreen.RouteName,
          arguments: {"round": widget.round},
        );
      },
      child: MouseRegion(
        onEnter: (mouseHoverEvent) {
          setState(() {
            this.isHovering = true;
          });
        },
        onExit: (mouseHoverEvent) {
          setState(() {
            this.isHovering = false;
          });
        },
        child: AnimatedContainer(
          // color: isHovering ? Colors.white : Colors.grey,
          duration: Duration(seconds: 1),
          margin: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Card(
            elevation: 0.25,
            color: isHovering ? Colors.white54 : Colors.white,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.all(10),
              color: isHovering ? Colors.white54 : Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: CircleAvatar(
                            child: Text(
                              "${widget.round.roundNumber}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: "Elegant TypeWriter",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Round Number" + " : ${widget.round.roundNumber}",
                            style: TextStyle(
                              fontFamily: "Elegant TypeWriter",
                            ),
                          ),
                          Text(
                            "Number of Students" +
                                " : ${widget.round.students}",
                            style: TextStyle(
                              fontFamily: "Elegant TypeWriter",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            widget.round.active ? "Learning" : "Finished",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.circle_sharp,
                            color:
                                widget.round.active ? Colors.green : Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(
                  //     top: 10,
                  //   ),
                  //   color: Colors.black38,
                  //   height: 1,
                  //   width: MediaQuery.of(context).size.width * 0.7,
                  //   child: SizedBox(
                  //     height: 1,
                  //     width: MediaQuery.of(context).size.width * 0.7,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
