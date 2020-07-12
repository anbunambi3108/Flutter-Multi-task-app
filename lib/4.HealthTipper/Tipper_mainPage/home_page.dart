import 'package:flutter/material.dart';
import 'package:final_proj/4.HEalthTipper/Tipper_mainPage/detailsPage.dart';
import 'colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'datas.dart';

class TipperHomePage extends StatefulWidget {
  @override
  _TipperHomePageState createState() => _TipperHomePageState();
}

class _TipperHomePageState extends State<TipperHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 36,
                        color: const Color(0x7c000000),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Health fun facts',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 18,
                              color: const Color(0x7c000000),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                         ),
                        // DropdownMenuItem(
                        //   child: Text(
                        //     'Health fun facts',
                        //     style: TextStyle(
                        //       fontFamily: 'Avenir',
                        //       fontSize: 18,
                        //       color: const Color(0x7c000000),
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        // DropdownMenuItem(
                        //   child: Text(
                        //     'Health fun facts',
                        //     style: TextStyle(
                        //       fontFamily: 'Avenir',
                        //       fontSize: 18,
                        //       color: const Color(0x7c000000),
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        // DropdownMenuItem(
                        //   child: Text(
                        //     'Health fun facts',
                        //     style: TextStyle(
                        //       fontFamily: 'Avenir',
                        //       fontSize: 18,
                        //       color: const Color(0x7c000000),
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        // DropdownMenuItem(
                        //   child: Text(
                        //     'Health fun facts',
                        //     style: TextStyle(
                        //       fontFamily: 'Avenir',
                        //       fontSize: 18,
                        //       color: const Color(0x7c000000),
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 54,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 10, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 70),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 100),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 30,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'health',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 20,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 32),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Know more',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Hero(
                          //   tag: planets[index].position,
                          //   child: Image.asset(planets[index].iconImage),
                          // ),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              planets[index].position.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 100,
                                color: primaryTextColor.withOpacity(0.08),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(27.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
