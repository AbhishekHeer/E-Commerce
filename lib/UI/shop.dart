import 'package:ecommerve/Controller/get.dart';
import 'package:ecommerve/UI/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

FetchingController controller = FetchingController();

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final texttheme = Theme.of(context).textTheme;
    return Obx(() => controller.isloading.value == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * .07, top: height * .07),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Products',
                            style: texttheme.displaySmall?.copyWith(
                                fontFamily: GoogleFonts.poppins().fontFamily),
                          ),
                          Text(
                            'Super summer sale',
                            style: texttheme.labelMedium?.copyWith(
                                fontFamily: GoogleFonts.poppins().fontFamily),
                          ),
                        ],
                      )),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final items = controller.productlist[index];

                    return SizedBox(
                        height: height * .2,
                        width: width,
                        child: Padding(
                            padding: EdgeInsets.only(
                                bottom: height * .03,
                                left: width * .05,
                                right: width * .05),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            productrating:
                                                items['rating'].toString(),
                                            productname:
                                                items['title'].toString(),
                                            productprice:
                                                items['price'].toString(),
                                            productimage:
                                                items['images'][0].toString(),
                                            productdis:
                                                items['description'].toString(),
                                            productcat: items['category'] ??
                                                "Unknown Category",
                                          )),
                                );
                              },
                              child: Card(
                                  elevation: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .only(
                                                            topStart:
                                                                Radius.circular(
                                                                    10),
                                                            bottomStart:
                                                                Radius.circular(
                                                                    10)),
                                                color: Colors.grey),
                                            height: height * .3,
                                            width: width * .4,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Image(
                                                      image: NetworkImage(
                                                          items['thumbnail'])),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      height *
                                                                          .03),
                                                          color: Colors.red),
                                                      height: height * .03,
                                                      width: width * .12,
                                                      child: Center(
                                                        child: Text(
                                                          "${items['discountPercentage'].toString()}%",
                                                          style: texttheme
                                                              .labelSmall
                                                              ?.copyWith(
                                                                  fontFamily: GoogleFonts
                                                                          .poppins()
                                                                      .fontFamily,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      )),
                                                )
                                              ],
                                            )),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: height * .02),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: width * .05,
                                                  color: const Color.fromARGB(
                                                      255, 255, 209, 27),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: width * .05,
                                                  color: const Color.fromARGB(
                                                      255, 255, 209, 27),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: width * .05,
                                                  color: const Color.fromARGB(
                                                      255, 255, 209, 27),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: width * .05,
                                                  color: const Color.fromARGB(
                                                      255, 255, 209, 27),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: width * .05,
                                                  color: const Color.fromARGB(
                                                      255, 255, 209, 27),
                                                ),
                                                Text(
                                                  '(${items['rating'].toString()})',
                                                  style: texttheme.labelSmall
                                                      ?.copyWith(
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: height * .02,
                                                top: height * .005),
                                            child: Text(
                                              items['category'].toString(),
                                              style: texttheme.titleSmall
                                                  ?.copyWith(
                                                      color:
                                                          Colors.grey.shade500,
                                                      fontFamily:
                                                          GoogleFonts.poppins()
                                                              .fontFamily),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: height * .02,
                                                top: height * .005),
                                            child: Text(
                                              items['brand'] == null
                                                  ? "Unknown Brand"
                                                  : items['brand'].toString(),
                                              style: texttheme.bodyLarge
                                                ?..copyWith(
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: height * .02,
                                                top: height * .005),
                                            child: Row(
                                              children: [
                                                Text(
                                                  items['price'].toString(),
                                                  style: texttheme.labelLarge
                                                      ?.copyWith(
                                                          color: Colors.red,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily),
                                                ),
                                                Icon(
                                                  CupertinoIcons.money_dollar,
                                                  size: height * .024,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            )));
                  },
                  itemCount: controller.productlist.length,
                ),
              ],
            ),
          ));
  }

  @override
  void initState() {
    super.initState();
    controller.fetchproduct();
  }
}
