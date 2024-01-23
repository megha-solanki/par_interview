import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:par_interview/bloc/home/home_event.dart';
import 'package:par_interview/constant/color_const.dart';
import 'package:par_interview/constant/textstyle_const.dart';
import 'package:par_interview/widgets/custom_button.dart';

import '../../bloc/home/home_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker picker = ImagePicker();
  String? imageUrl;
  String? fileName;

  uploadPhoto() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      context.read<HomeCubit>().uploadImage(imagePath: image.path);
    }
    log("-->$fileName");
  }

  getPhoto() {
    setState(() {
      imageUrl = "https://api.escuelajs.co/api/v1/files/$fileName";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        automaticallyImplyLeading: false,
        title: const Text(
          "Home",
          style: TextStyle(color: white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (imageUrl != null)Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(imageUrl!),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: uploadPhoto,
                          label: Text(
                            "Upload Picture",
                            style: MyTextStyles.semiBold15(color: white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: CustomButton(
                            onPressed: getPhoto,
                            label: Text(
                              "Get Picture",
                              style: MyTextStyles.semiBold15(color: white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
