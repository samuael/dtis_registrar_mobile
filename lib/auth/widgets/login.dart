import "../../libs.dart";

class LoginWidget extends StatefulWidget {
  Function forgotFunction;
  BuildContext screenContext;
  LoginWidget(this.forgotFunction, this.screenContext, {Key? key})
      : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool logging = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            " Login ",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Moms TypeWriter",
              fontSize: 22,
              // fontSize: 18
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: BlocBuilder<AuthBloc, AuthBlocState>(
            builder: (contexts, state) {
              if (state is AuthAdminLoggedIn) {
                return Text(
                  " succesfuly logged in ",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Elegant TypeWriter",
                    // fontSize: 18
                  ),
                );
              } else if (state is AuthAdminLoginNotSuccesful) {
                return Text(
                  " ${state.Msg} ",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Elegant TypeWriter",
                    // fontSize: 18,
                  ),
                );
              } else if (state is AuthAdminLoginOnProgress) {
                return Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                );
              }
              return Text(
                "  ",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Elegant TypeWriter",
                  // fontSize: 18,
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            cursorColor: Theme.of(context).primaryColorLight,
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              fillColor: Colors.lightBlue,
              hoverColor: Colors.lightBlue,
              suffixIcon: Icon(Icons.mail_outline),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextField(
            cursorColor: Theme.of(context).primaryColorLight,
            obscureText: hidePassword,
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
              suffix: GestureDetector(
                  child: hidePassword
                      ? Image.asset(
                          "assets/icon_images/icons8-eyelashes-3d-30.png",
                          color : Theme.of(context).primaryColor , 
                          width: 25,
                          height: 25)
                      : Image.asset(
                          "assets/icon_images/icons8-eyebrow-30.png",
                          color : Theme.of(context).primaryColor , 
                          width: 25,
                          height: 25,
                        ),
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  }),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          child: Stack(children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                animationDuration: Duration(seconds: 1),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                    vertical: StaticDataStore.DType == DeviceType.Tablet ||
                            StaticDataStore.DType == DeviceType.Phone
                        ? 10
                        : 20,
                    horizontal: 40,
                  ),
                ),
              ),
              onPressed: () async {
                // checking the validity of input values
                if (emailController.text == "" &&
                    passwordController.text == "") {
                  context.read<AuthBloc>().add(AuthAdminLoginNotSuccesfulEvent(
                      "please fill your email and password"));
                  return;
                } else if (emailController.text == "") {
                  context.read<AuthBloc>().add(AuthAdminLoginNotSuccesfulEvent(
                      "please fill the email entry"));
                  return;
                } else if (passwordController.text == "") {
                  context.read<AuthBloc>().add(AuthAdminLoginNotSuccesfulEvent(
                      "Please fill the password"));
                  return;
                } else if (!StaticDataStore.isEmail(emailController.text)) {
                  context.read<AuthBloc>().add(AuthAdminLoginNotSuccesfulEvent(
                      "Invalid email address "));
                  return;
                }

                if (emailController.text != "" &&
                    passwordController.text != "") {
                  // Either the email controller or the password controller are empty string.
                  context.read<AuthBloc>().add(AdminLoginInProgressEvent());
                  final result = await context.read<AuthBloc>().login(
                      AuthLoginEvent(
                          emailController.text, passwordController.text));
                  if (result is AuthAdminLoggedIn) {
                    context
                        .read<AuthBloc>()
                        .add(AuthAdminLoggedInEvent(result.admin));
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.RouteName, (route) => false);
                  } else if (result is AuthAdminLoginNotSuccesful) {
                    context
                        .read<AuthBloc>()
                        .add(AuthAdminLoginNotSuccesfulEvent(result.Msg));
                  } else if (result is AuthAdminLoginOnProgress) {
                    context.read<AuthBloc>().add(AdminLoginInProgressEvent());
                  }
                }
              },
              icon: Icon(Icons.login),
              label: Text(
                " Login ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // !(context.watch<AuthBloc>().state is AuthAdminLoginOnProgress)
          ]),
        ),
        GestureDetector(
          onTap: () {
            widget.forgotFunction();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "forgot password ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
