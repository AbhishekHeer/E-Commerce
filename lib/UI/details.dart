import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String productname;
  String productcat;
  String productimage;
  String productprice;
  String productdis;
  String productrating;
  DetailPage(
      {super.key,
      required this.productname,
      required this.productimage,
      required this.productprice,
      required this.productcat,
      required this.productdis,
      required this.productrating});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.left_chevron)),
        title: Text(
          widget.productcat,
          style: texttheme.titleLarge
              ?.copyWith(fontFamily: GoogleFonts.poppins().fontFamily),
        ),
        elevation: 10,
        centerTitle: true,
        actions: [
          const Icon(Icons.share_rounded),
          SizedBox(width: width * .05, height: 0.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height * .4,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(widget.productimage))),
            ),
            SizedBox(
              height: height * .14,
              width: width,
              child: Padding(
                padding: EdgeInsets.only(top: height * .02, left: width * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * .7,
                      height: height * .12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.productname,
                            style: texttheme.bodyMedium?.copyWith(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Brand : ${widget.productcat}",
                            style: texttheme.labelSmall?.copyWith(
                                color: Colors.grey.shade500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 0, height: height * .005),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: height * .02,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: height * .02,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: height * .02,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: height * .02,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: height * .02,
                                color: Colors.yellow,
                              ),
                              Text(
                                '(${widget.productrating})',
                                style: texttheme.labelSmall?.copyWith(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .1,
                      width: width * .26,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: height * .002),
                            child: Icon(
                              CupertinoIcons.money_dollar,
                              size: height * .03,
                            ),
                          ),
                          Text(
                            widget.productprice,
                            style: texttheme.bodyLarge?.copyWith(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Center(
                child: Text(
                  widget.productdis,
                  textAlign: TextAlign.justify,
                  style: texttheme.bodyMedium?.copyWith(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: height * .03),
        decoration: const BoxDecoration(color: Colors.white30),
        height: height * .1,
        width: width,
        child: Center(
          child: Container(
              height: height * .06,
              width: width * .8,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(height * .03),
              ),
              child: Center(
                child: Text(
                  "Add To Cart",
                  style: texttheme.titleMedium?.copyWith(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
