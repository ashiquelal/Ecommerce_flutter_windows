import '../utils/Dimensions.dart' as Dimensions;
import 'package:first_app_desktop/utils/colors.dart';
import 'package:first_app_desktop/widget/BigText.dart';
import 'package:first_app_desktop/widget/SmallText.dart';
import 'package:first_app_desktop/widget/icon_and_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart  ';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var _currPageValue = 0.0;
  PageController pageController =
      PageController(viewportFraction: Dimensions.pageView.viewportFraction());
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      listen(pageController);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  void listen(PageController pageController) {
    setState(() {
      _currPageValue = pageController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: Dimensions.pageView.base(),
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
            size: Size.square(Dimensions.height(9)),
            activeSize: Size(Dimensions.height(18), Dimensions.height(9)),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    double _scaleFactor = 0.8;
    double _height = Dimensions.pageView.Container();
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
    double value = Dimensions.pageView.base();
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
              height: Dimensions.pageView.Container(),
              margin: EdgeInsets.only(
                  left: Dimensions.width(10), right: Dimensions.width(10)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Colors.green : Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/food0.png")))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageView.ContainerText(),
              margin: EdgeInsets.only(
                  left: Dimensions.width(30),
                  right: Dimensions.width(30),
                  bottom: Dimensions.height(30)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius(20)),
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
                padding: EdgeInsets.only(
                    top: Dimensions.height(15),
                    left: Dimensions.width(15),
                    right: Dimensions.width(15)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: value.toString()),
                      SizedBox(
                        height: Dimensions.height(10),
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.maincolor,
                                      size: Dimensions.fontSize(15),
                                    )),
                          ),
                          SizedBox(
                            width: Dimensions.width(10),
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: Dimensions.width(10),
                          ),
                          SmallText(text: "1234"),
                          SizedBox(
                            width: Dimensions.width(10),
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height(15),
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
