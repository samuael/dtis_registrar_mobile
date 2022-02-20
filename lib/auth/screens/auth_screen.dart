import 'package:drivers_dev/auth/widgets/forgot_pwd.dart';
import 'package:drivers_dev/auth/widgets/login.dart';

import "../../libs.dart";

class AuthScreen extends StatefulWidget {
  static const RouteName = "/auth";
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController pageController = PageController();

  int index = 1;
  void changeWidget() {
    if (index == 1) {
      pageController.animateToPage(index + 1,
          duration: Duration(seconds: 2), curve: Curves.elasticOut);
      index = 2;
    } else if (index == 2) {
      pageController.previousPage(
          duration: Duration(seconds: 2), curve: Curves.elasticOut);
      index = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Icon(
            Icons.more,
            color: Colors.blue,
            size: 40,
          )
        ],
        centerTitle: true,
        title: Text(
          "Welcome to DTIS",
          style: TextStyle(
            color: Colors.white,
            // fontFamily: "Elegant TypeWriter",
            fontFamily: "Moms TypeWriter",
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.elliptical(300, 100)),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(190, 100)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                                style: BorderStyle.none,
                                width: 0,
                                color: Colors.grey),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.75,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: StaticDataStore.DType == DeviceType.Tablet ||
                        StaticDataStore.DType == DeviceType.Phone
                    ? MediaQuery.of(context).size.height * 0.65
                    : MediaQuery.of(context).size.height * 0.7,
                // color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(
                      //   height: 60,
                      // ),
                      Stack(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.only(top: 60),
                              height: StaticDataStore.DType ==
                                          DeviceType.Tablet ||
                                      StaticDataStore.DType == DeviceType.Phone
                                  ? MediaQuery.of(context).size.height * 0.55
                                  : MediaQuery.of(context).size.height * 0.6,
                              width: StaticDataStore.DType ==
                                          DeviceType.Tablet ||
                                      StaticDataStore.DType == DeviceType.Phone
                                  ? MediaQuery.of(context).size.width * 0.9
                                  : MediaQuery.of(context).size.height * 0.5,
                              child: Center(
                                child: Card(
                                  elevation: 5,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: PageView(
                                        controller: pageController,
                                        onPageChanged: (i) {
                                          setState(() {
                                            index = i + 1;
                                          });
                                        },
                                        children: [
                                          LoginWidget(changeWidget, context),
                                          ForgotPassword(changeWidget),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  "assets/icon_images/agri_net_final_temporary_logo.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            top: 0,
                            left: StaticDataStore.DType == DeviceType.Tablet ||
                                    StaticDataStore.DType == DeviceType.Phone
                                ? MediaQuery.of(context).size.width * 0.4 - 10
                                : MediaQuery.of(context).size.height * 0.2 - 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
