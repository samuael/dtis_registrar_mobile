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
        BlocProvider(
          create: (context) => CategoriesBloc(CategoryInit()),
        ),
        BlocProvider(
          create: (context) => NavigationIndexBloc(1),
        ),
        BlocProvider(
          create: (context) => CategoryOptionIndexBloc(),
        ),
        BlocProvider(
          create: (context) => RoundsBloc(RoundInit()),
        ),
        BlocProvider(
          create: (context) => RoundOptionsIndexBloc(),
        ),
        BlocProvider(
          create: (context) => RoundInfoVisibility(),
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
      title: 'DTIS Registration System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case CategoriesScreen.RouteName:
            {
              return MaterialPageRoute(builder: (context) {
                final category = (routeSetting.arguments
                    as Map<String, dynamic>)["category"];
                return CategoriesScreen(categoryId: (category as Category).id);
              });
            }
          case HomeScreen.RouteName:
            {
              return MaterialPageRoute(builder: (context) {
                return HomeScreen();
              });
            }
          case AuthScreen.RouteName:
            {
              return MaterialPageRoute(builder: (context) {
                return AuthScreen();
              });
            }
          case StudentsScreen.RouteName:
            {
              return MaterialPageRoute(builder: (context) {
                return StudentsScreen();
              });
            }
          case CreateRoundScreen.RouteName:
            {
              final categoryid = (routeSetting.arguments
                  as Map<String, dynamic>)["category_id"] as int;
              return MaterialPageRoute(builder: (context) {
                return CreateRoundScreen(categoryid);
              });
            }
          case RoundsScreen.RouteName:
            {
              final round = (routeSetting.arguments
                  as Map<String, dynamic>)["round"] as Round;
              return MaterialPageRoute(builder: (context) {
                return RoundsScreen(round.id);
              });
            }
          case StudentRegistrationScreen.RouteName:
            {
              final roundID = (routeSetting.arguments
                  as Map<String, dynamic>)["round_id"] as int;
              return MaterialPageRoute(builder: (context) {
                return StudentRegistrationScreen(roundID: roundID);
              });
            }
        }
      },
      initialRoute: AuthScreen.RouteName,
    );
  }
}
