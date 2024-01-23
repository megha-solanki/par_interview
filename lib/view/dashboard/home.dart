import 'package:flutter/material.dart';
import 'package:par_interview/constant/color_const.dart';
import 'package:par_interview/constant/textstyle_const.dart';
import 'package:par_interview/widgets/custom_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: const Text(
          "Home",
          style: TextStyle(color: white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: CustomButton(
            label: Text(
              "Select Picture",
              style: MyTextStyles.semiBold15(color: white),
            ),
          ),
        ),
      ),
    );
  }
}
