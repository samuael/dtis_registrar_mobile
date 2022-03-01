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
          create : (context)=> NavigationIndexBloc(1),
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
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case CategoriesScreen.RouteName:
            {
              return MaterialPageRoute(builder: (context) {
                final category = (routeSetting.arguments
                    as Map<String, dynamic>)["category"];
                return CategoriesScreen(category: category);
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
            case StudentsScreen.RouteName :{
              return MaterialPageRoute( builder: (context){
                return StudentsScreen();
              });
            }
        }
      },
      initialRoute: AuthScreen.RouteName,
      home: AuthScreen(),
    );
  }
}
