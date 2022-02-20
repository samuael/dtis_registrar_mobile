import 'package:flutter/material.dart';

import 'libs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDeviceType();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(repo: AuthRepo(provider: AuthProvider())),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      routes: {
        AuthScreen.RouteName: (context) {
          return AuthScreen();
        },
        HomeScreen.RouteName: (context) {
          return HomeScreen();
        },
      },
    );
  }
}
