import "../../libs.dart";

class PayinItem extends StatefulWidget {
  final PayIn payment;
  const PayinItem(this.payment, {Key? key}) : super(key: key);

  @override
  State<PayinItem> createState() => _PayinItemState();
}

class _PayinItemState extends State<PayinItem> {
  bool hovering = false;
  /*  double amount;
  int recievedBy;
  int studentID;
  Date createdAt;
  int roundID;
  int status; */
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (prt) {
        setState(() {
          this.hovering = true;
        });
      },
      onExit: (prt) {
        setState(() {
          this.hovering = false;
        });
      },
      child: Container(
        color: hovering ? Colors.white : Colors.white38,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Paid Amount : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.payment.amount}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Date: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.payment.createdAt.toString()}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Recieved By : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (context.watch<AdminsListBloc>().state
                                  is AdminsListLoadSuccess)
                              ? "${(context.watch<AdminsListBloc>().state as AdminsListLoadSuccess).getAdminByID(widget.payment.recievedBy)!.fullname}"
                              : "Unknown",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Status : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          // padding:
                          //     EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          height: 20,
                          width: 110,
                          color:
                              paymentStatusColors[this.widget.payment.status],
                          child: Row(
                            children: [
                              Icon(
                                paymentStatusIcons[this.widget.payment.status],
                                color: Colors.white,
                              ),
                              Text(
                                paymentStatusMessages[
                                    this.widget.payment.status],
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
