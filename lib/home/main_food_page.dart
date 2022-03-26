import 'package:first_app_desktop/home/food_page_body.dart';
import '../utils/Dimensions.dart' as Dimensions;
import 'package:first_app_desktop/utils/colors.dart';
import 'package:first_app_desktop/widget/BigText.dart';
import 'package:first_app_desktop/widget/SmallText.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    double value = MediaQuery.of(context).size.width;
    Dimensions.context = context;
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.height(15),
                      bottom: Dimensions.height(15)),
                  padding: EdgeInsets.only(
                      left: Dimensions.width(15), right: Dimensions.width(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(
                            text: Dimensions.width(1).toString(),
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
                          width: Dimensions.width(45),
                          height: Dimensions.height(45),
                          child: Icon(Icons.search, color: Colors.white),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius(15)),
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
