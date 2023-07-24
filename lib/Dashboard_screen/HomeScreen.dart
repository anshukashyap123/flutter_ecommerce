import 'package:flutter_ecommerce/Const/Lists.dart';
import 'package:flutter_ecommerce/Const/strings.dart';
import 'package:flutter_ecommerce/Const/consts.dart';
import 'package:flutter_ecommerce/Widgets/home_button.dart';
import 'package:flutter_ecommerce/Const/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        width: context.screenWidth,
        height: context.screenHeight,
        color: lightGrey,
        child: SafeArea(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              color: Vx.gray100,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: Search,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: textfieldGrey),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ).box.rounded.make(),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 180,
                        enlargeCenterPage: true,
                        itemCount: SliderList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              SliderList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10))
                                .make(),
                          );
                        }),
                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                              (index) => homeButton(
                            width: context.screenHeight * 0.2,
                            height: context.screenWidth / 3.5,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? TodayDeal : FlashDeal,
                          )),
                    ),
                    10.heightBox,
                    //2nd swiper

                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: SliderList2.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              SliderList2[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10))
                                .make(),
                          );
                        }),

                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                              (index) => homeButton(
                            width: context.screenHeight * 0.2,
                            height: context.screenWidth / 2.5,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? TodayDeal : FlashDeal,
                          )),
                    ),
                  ],

                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
