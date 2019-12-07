import 'package:flutter/material.dart';
import 'package:flutter_freefire/bloc/auth_bloc.dart';
import 'package:flutter_freefire/bloc/home_bloc.dart';
import 'package:flutter_freefire/screens/auth/index.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthBloc>.value(
          value: AuthBloc(),
        ),
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Freefire',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primaryColor: Colors.red[800],
          fontFamily: 'Lato',
        ),
        home: Auth(),
      ),
    );
  }
}
