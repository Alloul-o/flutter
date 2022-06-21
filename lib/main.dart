import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/counter.bloc.dart';
import 'package:flutter_project/ui/pages/Counter.bloc.page.dart';
import 'package:flutter_project/ui/pages/Git.users.page.dart';
import 'package:flutter_project/ui/pages/counter.stful.page.dart';
import 'package:flutter_project/ui/pages/home.page.dart';

import 'bloc/users.bloc.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>CounterBloc()),
      BlocProvider(create: (context)=>UsersBloc()),
    ],
        child: RootView());
  }
}
class RootView extends StatelessWidget {
  const RootView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen
      ),
    routes: {
      "/":(context)=>const HomePage(),
      "/counter1":(context)=>const CounterStfulPage(),
      "/counter2":(context)=>const CounterBlocPage(),
      "/users":(context)=>const GitUsersPage(),

    },
      initialRoute: "/",
    );
  }
}

