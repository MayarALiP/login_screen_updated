import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_updated/blocks/ads_block.blocks.dart';
import 'package:login_screen_updated/utilities/colors.utilities.dart';
import 'package:login_screen_updated/widgets/section_header.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  final AdsBloc _adsBloc = AdsBloc();
  var sliderIndex = 0;

  @override
  void initState() {
    _adsBloc.add(LoadAdsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _adsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Icons.menu,
            color: Colors.white70,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.notifications_none),
          )
        ], // action
      ),
      body: SafeArea(
        child: Column(children: [
          BlocBuilder<AdsBloc, AdsState>(
            bloc: _adsBloc,
            builder: (context, state) {
              if (state is AdsLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is AdsLoadedState) {
                return Column(children: [
                  CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 200,
                      viewportFraction: .75,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) {
                        sliderIndex = index;
                        setState(() {});
                      },
                      enlargeFactor: .3,
                    ),
                    items: state.ads.map((ad) {
                      return Stack(children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(ad.image!),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                ad.title.toString(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                  DotsIndicator(
                    dotsCount: state.ads.length,
                    position: sliderIndex,
                    onTap: (position) async {
                      await buttonCarouselController.animateToPage(position);
                      sliderIndex = position;
                      setState(() {});
                    },
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  const SectionHeader(sectionName: 'Today\'s Fresh Recipes'),
                  // ... (your existing code for Today's Fresh Recipes)
                  const SectionHeader(sectionName: 'New Ingredients'),
                ]);
              } else if (state is AdsErrorState) {
                return Text("Error: ${state.error}");
              } else {
                return const SizedBox(); // Handle other states as needed
              }
            },
          ),
          const SectionHeader(sectionName: 'Today\'s Fresh Recipes'),
          Card(
            elevation: 2,
            child: Container(
              width: 240,
              decoration: BoxDecoration(
                color: const Color(ColorsConst.containerWhiteBackgroundColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: Column(children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                    ),
                    Flexible(
                      child: Transform.translate(
                        offset: const Offset(20, 0),
                        child: Image.asset(
                          'assets/images/french_toast.png',
                          height: 140,
                          width: 250,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  ]),
                  const Column(children: [
                    Row(
                      children: [
                        Text(
                          'Breakfast',
                          style:
                              TextStyle(color: Color(0xff1F95B3), fontSize: 13),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(children: [
                        Text(
                          'Fresh Toast With Berries',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                    ),
                    Row(children: [
                      Icon(
                        Icons.star,
                        color: Color(ColorsConst.orangeColor),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(ColorsConst.orangeColor),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(ColorsConst.orangeColor),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(ColorsConst.orangeColor),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(ColorsConst.orangeColor),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(children: [
                        Text(
                          '120 Calories',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(ColorsConst.orangeColor),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                    ),
                  ]),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '10 minutes',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        Row(children: [
                          Icon(
                            Icons.access_time,
                            size: 18,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '1 serving',
                            style: TextStyle(color: Colors.grey),
                          )
                        ]),
                      ]),
                ]),
              ),
            ),
          ),
          const SectionHeader(sectionName: 'New Ingredients'),
        ]),
      ),
    );
  }
}

// void getAds() async {
//   try {
//     var adsData = await rootBundle.loadString('assets/data/sample.json');
//     var dataDecoded =
//         List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);
//
//     adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
//     setState(() {});
//   } catch (e) {
//     print(e);
//   }
// }
