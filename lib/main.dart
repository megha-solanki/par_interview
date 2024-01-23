import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:par_interview/bloc/auth/login_cubit.dart';
import 'package:par_interview/bloc/product/product_cubit.dart';
import 'package:par_interview/constant/color_const.dart';
import 'package:par_interview/view/login.dart';
import 'view/dashboard/dash_bottom_navigaion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => ProductCubit())
        ],
        child: const Login(),
      ),
    );
  }
}
