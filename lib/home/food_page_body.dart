import 'package:first_app_desktop/utils/Dimensions.dart';
import 'package:first_app_desktop/utils/colors.dart';
import 'package:first_app_desktop/widget/BigText.dart';
import 'package:first_app_desktop/widget/SmallText.dart';
import 'package:first_app_desktop/widget/icon_and_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart  ';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                scrollBehavior: MaterialScrollBehavior()
                    .copyWith(dragDevices: {PointerDeviceKind.mouse}),
                // allowImplicitScrolling: true,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                })),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.maincolor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var _currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var _currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var curTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var _currScale =
          _scaleFactor + (_currPageValue - index - 1) * (1 - _scaleFactor);
      var curTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var _currScale = 0.8;
      var curTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Colors.green : Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/food0.png")))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewContainerText,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0x373A3A3A),
                      blurRadius: 5,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Some Dish"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.maincolor,
                                      size: 15,
                                    )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "1234"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconcolor: AppColors.iconcolor1),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "1.7 km",
                              iconcolor: AppColors.maincolor),
                          IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: "32 min",
                              iconcolor: AppColors.iconcolor1),
                        ],
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
