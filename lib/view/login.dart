import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:par_interview/bloc/auth/login_bloc.dart';
import 'package:par_interview/bloc/auth/login_event.dart';
import 'package:par_interview/bloc/auth/login_state.dart';
import 'package:par_interview/constant/color_const.dart';
import 'package:par_interview/constant/design_const.dart';
import 'package:par_interview/constant/textstyle_const.dart';
import 'package:par_interview/view/dashboard/dash_bottom_navigaion.dart';
import 'package:par_interview/widgets/custom_button.dart';
import 'package:par_interview/widgets/custom_textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRemember = false;
  bool showPassword = false;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DashBottomNavigationBar();
                    },
                  ),
                );
                print(
                    'Authenticated successfully. Token: ${state.authModel.token}');
              } else if (state is AuthFailure) {
                print('Authentication error: ${state.message}');
              }
            },
            builder: (context, state) {
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Log in to your account",
                      style: TextStyle(
                          fontSize: 21,
                          color: white,
                          fontWeight: FontWeight.w600),
                    ),
                    DesignConst.gap6,
                    Text(
                      "Welcome back! please enter your details.",
                      style: MyTextStyles.regular14(color: grey500),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextFormField(
                      label: "Email",
                      controller: txtEmail,
                      hintText: "Enter your email",
                      pWidget: const Icon(
                        Icons.mail_outline,
                        size: 20,
                        color: grey500,
                      ),
                    ),
                    CustomTextFormField(
                      isPassword: showPassword,
                      label: "Password",
                      controller: txtPassword,
                      pWidget: const Icon(
                        Icons.lock_outline_sharp,
                        size: 20,
                        color: grey500,
                      ),
                      sWidget: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.white38,
                            size: 26,
                          )),
                      hintText: "Enter your password",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 25,
                              child: Transform.scale(
                                scale: 0.9,
                                child: Checkbox(
                                    value: isRemember,
                                    onChanged: (val) {
                                      setState(() {
                                        isRemember = val!;
                                      });
                                    }),
                              ),
                            ),
                            DesignConst.gap4,
                            Text(
                              "Remember for 30 days",
                              style: MyTextStyles.regular13(color: grey500),
                            )
                          ],
                        ),
                        Text(
                          "Forgot password",
                          style: MyTextStyles.regular13(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                      label: state is AuthLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              "Log in",
                              style: MyTextStyles.semiBold15(color: white),
                            ),
                      onPressed: () {
                        final email = txtEmail.text;
                        final password = txtPassword.text;
                        context.read<AuthBloc>().add(
                            LoginEvent(username: email, password: password));
                      },
                    ),
                    DesignConst.gap15,
                    SizedBox(
                      height: 46,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side:
                                  const BorderSide(color: grey100, width: 0.25),
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            transparent,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  "assets/google.png",
                                  height: 23,
                                  width: 23,
                                )),
                            Center(
                              child: Text(
                                "Log in with Google",
                                style: MyTextStyles.semiBold13(color: white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DesignConst.gap12,
                    SizedBox(
                      height: 46,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side:
                                  const BorderSide(color: grey100, width: 0.25),
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            transparent,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  "assets/facebook.png",
                                  height: 27,
                                  width: 27,
                                )),
                            Center(
                              child: Text(
                                "Log in with Facebook",
                                style: MyTextStyles.semiBold13(color: white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: MyTextStyles.regular13(color: grey500),
                        ),
                        Text(
                          "Sign up",
                          style: MyTextStyles.regular13(color: white),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
