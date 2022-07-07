import 'package:bidder/data/model/models.dart';
import 'package:bidder/presentation/pages/view_item_page/widgets/header_info/widgets/header_details.dart';
import 'package:bidder/presentation/widgets/custom_container.dart';
import 'package:bidder/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        final itemImageheight = MediaQuery.of(context).size.height * 0.4;
        final itemInfoContainerheight = itemImageheight * 0.2;
        final itemInfoContainerWidth = MediaQuery.of(context).size.width * 0.9;
        final itemInfoContainerVerticalPadding = 15.0;

        return Stack(
          children: [
            Column(
              children: [
                Container(
                  height: itemImageheight,
                  width: double.infinity,
                  color: primaryColor,
                  // child: Image.asset(
                  //   'assets/images/item_images/goal.jpg',
                  //   fit: BoxFit.cover,
                  // ),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: product.images.length,
                    itemBuilder: (
                      BuildContext context,
                      int itemIndex,
                      int pageViewIndex,
                    ) =>
                        Container(
                      child: Image.network(
                        product.images[itemIndex]['url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: itemInfoContainerVerticalPadding),
                  height: itemInfoContainerheight / 2,
                  width: double.infinity,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: pagePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainer(
                      width: itemInfoContainerWidth,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: itemInfoContainerVerticalPadding),
                      child: ViewItemHeaderInfoDetails(product: product),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: paddingSize, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CustomContainer(
                        child: Icon(
                          Icons.chevron_left_rounded,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    CustomContainer(
                      child: Icon(Icons.favorite_border,
                          size: 30, color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
