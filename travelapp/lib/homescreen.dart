import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp/bottombar.dart';
import 'package:travelapp/models/products/popular.dart';
import 'package:travelapp/models/products/recommendations.dart';
import 'package:travelapp/models/widgets/roundedborder.dart';
import 'package:travelapp/themeprovider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(
    viewportFraction: 0.977,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: 57.0,
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 57.0,
                      width: 57.0,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Color(0x080a928)),
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 57.0,
                          width: 57.0,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color: Color(0x080a928)),
                          child: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ),
                        Consumer<ThemeNotifier>(
                          builder: (context, notifier, child) => IconButton(
                            icon: Icon(Icons.wb_sunny_outlined),
                            onPressed: () {
                              notifier.toggleTheme();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.7),
                child: Text('Travel\n With Travify',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                    )),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 14.4, top: 28.6),
                child: DefaultTabController(
                    length: 4,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                        indicatorPadding:
                            EdgeInsets.only(left: 14.4, right: 14.4),
                        isScrollable: true,
                        labelColor: Color(0xff000000),
                        unselectedLabelColor: Color(0xff8a8a8a),
                        labelStyle: GoogleFonts.lato(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: GoogleFonts.lato(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                        indicator: RoundedRectangularTabIndicator(
                            color: Color(0xff8a8a8a), weight: 2.4, width: 14.0),
                        tabs: [
                          Tab(
                            child: Container(
                              child: Text('Recomended'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Popular'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('New Destination'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Text('Hidden Gems'),
                            ),
                          ),
                        ])),
              ),
              Container(
                height: 210.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      recommendations.length,
                      (int index) => Container(
                        height: 210.4,
                        margin: EdgeInsets.only(top: 16, left: 17),
                        width: 320.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(recommendations[index].image),
                            )),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 19.2,
                              left: 11.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 0.9,
                                    sigmaX: 0.9,
                                  ),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                        left: 16.72,
                                        right: 14.4,
                                      ),
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 10),
                                          Text(recommendations[index].name,
                                              style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 16.0,
                                              )),
                                        ],
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 28.0),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: recommendations.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xff8a8a8a),
                      dotColor: Color(0xffababab),
                      dotHeight: 4.7,
                      dotWidth: 6,
                      spacing: 4.7,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 33, left: 29, right: 29),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Categories',
                      style: GoogleFonts.playfairDisplay(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Color(0xff000000)),
                    ),
                    Text(
                      'Show all',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff000000)),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 28.0, bottom: 16.0),
                height: 124,
                child: ListView.builder(
                    itemCount: recommendations.length,
                    padding: EdgeInsets.only(left: 28.0, right: 12),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 124.9,
                        width: 189,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(recommendations[index].image),
                              fit: BoxFit.cover,
                            )),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
