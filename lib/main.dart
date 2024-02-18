import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/view/dolphin_homepage/dolphin_homepage.dart';
import 'core/constants/strings.dart';
import 'cubit/dolphin/dolphin_cubit.dart';
import 'cubit/observer/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: BlocProvider(
          create: (context) => DolphinCubit(),
          child: const DolphinHomepage(),
        ),
      ),
    );

  }
}

