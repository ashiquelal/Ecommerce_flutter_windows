import 'package:first_app_desktop/home/food_page_body.dart';
import 'package:first_app_desktop/utils/colors.dart';
import 'package:first_app_desktop/widget/BigText.dart';
import 'package:first_app_desktop/widget/SmallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(
                            text: "Netherlands",
                            color: AppColors.maincolor,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: "Amsterdam",
                                color: Colors.black54,
                              ),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 45,
                          height: 45,
                          child: Icon(Icons.search, color: Colors.white),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                        ),
                      )
                    ],
                  ))),
          FoodPageBody(),
        ],
      ),
    );
  }
}
