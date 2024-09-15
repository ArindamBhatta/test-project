import 'dart:async';
import '../../../repo/repo.dart';
import 'package:flutter/material.dart';
import 'second_heading.dart';
import 'text_button_heading.dart';
import 'visible_content_and_toggle_view.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class MainPageViewController extends StatefulWidget {
  const MainPageViewController({super.key});

  @override
  State<MainPageViewController> createState() {
    return _HeadingContainerState();
  }
}

class _HeadingContainerState extends State<MainPageViewController> {
  int? visibleCardIndex;
  int? visibleBackground = 0;
  late Future<Map<String, dynamic>?> _dataFuture;
  PageController ctrl = PageController();

  @override
  void initState() {
    super.initState();
    _dataFuture = accessSecondApi();
  }

  Future<Map<String, dynamic>?> accessSecondApi() async {
    try {
      Map<String, dynamic>? resolvedData = await Repo.accessSecondApi();
      print("Accessing from dart key ➡️➡️${resolvedData?['data']?['tt']}");
      return resolvedData;
    } catch (error) {
      print("Error occurred: $error");
      return null;
    }
  }

  void toggleVisibility(int index) {
    setState(() {
      visibleCardIndex = (visibleCardIndex == index) ? null : index;
    });
  }

  void toggleBackground(int index) {
    setState(() {
      visibleBackground = (visibleBackground == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<Map<String, dynamic>?>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              alignment: Alignment.center,
              height: 100.0,
              color: Colors.white,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: Colors.black,
              ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          print("print data in UI ➡️" + (data['data']?['tt']).toString());
          return Container(
            width: screenWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(155, 0, 0, 0),
                  spreadRadius: 4,
                  blurRadius: 3,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButtonHeading(
                        containerText: 'Top 10',
                        buttonBackgroundState: visibleBackground == 0,
                        onButtonPressed: () {
                          ctrl.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      TextButtonHeading(
                        containerText: 'Gainers',
                        buttonBackgroundState: visibleBackground == 1,
                        onButtonPressed: () {
                          ctrl.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      TextButtonHeading(
                        containerText: 'Losers',
                        buttonBackgroundState: visibleBackground == 2,
                        onButtonPressed: () {
                          ctrl.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      TextButtonHeading(
                        containerText: 'Trending',
                        buttonBackgroundState: visibleBackground == 3,
                        onButtonPressed: () {
                          ctrl.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      TextButtonHeading(
                        containerText: 'News',
                        buttonBackgroundState: visibleBackground == 4,
                        onButtonPressed: () {
                          ctrl.animateToPage(
                            4,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SecondHeading(),
                ExpandablePageView(
                  onPageChanged: (horizontalScrollValue) {
                    toggleBackground(horizontalScrollValue);
                  },
                  controller: ctrl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          for (int i = 1; i <= (data['data']['tt'].length); i++)
                            VisibleContentAndToggleView(
                              name: 'BitCoin',
                              shortName: 'BTC',
                              conditionalValue: '0.3919',
                              totalValue: '568756.00',
                              currencyShort: '1.00',
                              isHiddenDataVisible: visibleCardIndex == i,
                              onVisibilityChanged: () => toggleVisibility(i),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          for (int i = 11; i <= 20; i++)
                            VisibleContentAndToggleView(
                              name: 'HitCoin',
                              shortName: 'BTC',
                              conditionalValue: '0.3919',
                              totalValue: '568756.00',
                              currencyShort: '1.00',
                              isHiddenDataVisible: visibleCardIndex == i,
                              onVisibilityChanged: () => toggleVisibility(i),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          for (int i = 21; i <= 30; i++)
                            VisibleContentAndToggleView(
                              name: 'Ethereum',
                              shortName: 'BTC',
                              conditionalValue: '0.3919',
                              totalValue: '568756.00',
                              currencyShort: '1.00',
                              isHiddenDataVisible: visibleCardIndex == i,
                              onVisibilityChanged: () => toggleVisibility(i),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          for (int i = 31; i <= 40; i++)
                            VisibleContentAndToggleView(
                              name: 'Tether',
                              shortName: 'BTC',
                              conditionalValue: '0.3919',
                              totalValue: '568756.00',
                              currencyShort: '1.00',
                              isHiddenDataVisible: visibleCardIndex == i,
                              onVisibilityChanged: () => toggleVisibility(i),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          for (int i = 41; i <= 50; i++)
                            VisibleContentAndToggleView(
                              name: 'BNB',
                              shortName: 'BTC',
                              conditionalValue: '0.3919',
                              totalValue: '568756.00',
                              currencyShort: '1.00',
                              isHiddenDataVisible: visibleCardIndex == i,
                              onVisibilityChanged: () => toggleVisibility(i),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
