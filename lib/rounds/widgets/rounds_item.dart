import "../../libs.dart";

class RoundItem extends StatelessWidget {
  final Round round;
  const RoundItem({Key? key, required this.round}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration : Duration(seconds : 1) , 
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Card(
        elevation: 0.25,
        child: Container(
          padding: EdgeInsets.all(10),
          // decoration: BoxDecoration(
          //   border: Border.symmetric(
          //     horizontal: BorderSide(
          //       color: Colors.black38,
          //     ),
          //   ),
          // ),
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
                          "${round.roundNumber}",
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
                        "Round Number" + " : ${round.roundNumber}",
                        style: TextStyle(
                          fontFamily: "Elegant TypeWriter",
                        ),
                      ),
                      Text(
                        "Number of Students" + " : ${round.students}",
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
                        round.active ? "Learning" : "Finished",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.circle_sharp,
                        color: round.active ? Colors.green : Colors.red,
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
    );
  }
}
