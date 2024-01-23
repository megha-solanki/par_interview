import 'package:flutter/material.dart';
import 'package:par_interview/constant/color_const.dart';
import 'package:par_interview/constant/design_const.dart';
import 'package:par_interview/constant/textstyle_const.dart';
import 'package:par_interview/view/dashboard/product.dart';

import 'home.dart';

class DashBottomNavigationBar extends StatefulWidget {

  const DashBottomNavigationBar({super.key});

  @override
  State<DashBottomNavigationBar> createState() =>
      _DashBottomNavigationBarState();
}

class _DashBottomNavigationBarState extends State<DashBottomNavigationBar> {
  int currentIndex = 0;
  PageController pageController = PageController();

  changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [Home(), Product()],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16)
          ),
          color: lightBlack,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  changePage(0);
                },
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Icon(Icons.home_outlined,color:  currentIndex==0?white:grey600),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text("Home",style: MyTextStyles.regular13(color: currentIndex==0?white:grey600),),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  changePage(1);
                },
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.crop_square,color:  currentIndex==1?white:grey600),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text("Product",style:  MyTextStyles.regular13(color: currentIndex==1?white:grey600),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
