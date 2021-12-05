import "../../libs.dart";

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
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
          ),
        ),
      ),
      body: Center(
        child: Stack(children: [
          Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height * 0.9,
              width: double.infinity,
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
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.elliptical(300, 100)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: Card(
                  elevation: 5,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "email",
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "password",
                              // helperText: "******",
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(30),
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 40,
                            ))),
                            onPressed: () {
                              if (emailController.text != "" &&
                                  passwordController.text != "") {
                                // Either the email controller or the password controller are empty string.
                                context.read<AuthBloc>().add(AuthLoginEvent(
                                    emailController.text,
                                    passwordController.text));
                              }
                            },
                            icon: Icon(Icons.add),
                            label: Text(" Login "),
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "forgot password ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
