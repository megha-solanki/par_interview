import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:par_interview/bloc/auth/login_bloc.dart';
import 'package:par_interview/bloc/home/home_bloc.dart';
import 'package:par_interview/bloc/product/product_bloc.dart';
import 'package:par_interview/constant/color_const.dart';
import 'package:par_interview/repository/home_api.dart';
import 'package:par_interview/repository/login_api.dart';
import 'package:par_interview/repository/product_repo.dart';
import 'package:par_interview/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
        RepositoryProvider(
          create: (context) => HomeRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: black,
          fontFamily: 'Outfit',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    AuthBloc(authRepository: context.read<AuthRepository>())),
            BlocProvider(
                create: (context) => ProductBloc(
                    productRepository: context.read<ProductRepository>())),
            BlocProvider(
                create: (context) =>
                    HomeBloc(homeRepository: context.read<HomeRepository>())),
          ],
          child: const Login(),
        ),
      ),
    );
  }
}
