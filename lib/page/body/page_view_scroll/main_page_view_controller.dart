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
  List<Map<String, dynamic>> dataContainers = [];

  PageController ctrl = PageController();

  @override
  void initState() {
    super.initState();
    _dataFuture = accessSecondApi();
  }

  Future<Map<String, dynamic>?> accessSecondApi() async {
    try {
      Map<String, dynamic>? resolvedData = await Repo.accessSecondApi();
      if (resolvedData != null) {
        print("Accessing from dart key ➡️➡️${resolvedData['data']?['tt']}");
        setState(() {
          dataContainers = [
            {
              'name': 'Bitcoin',
              'shortName': 'BTC',
              'conditionalValue': '3.41',
              'totalValue': '568756.00',
              'currencyShort': '1.00T'
            },
            {
              'name': 'Ethereum',
              'shortName': 'ETH',
              'conditionalValue': '0.2932',
              'totalValue': '475847.00',
              'currencyShort': '1.00'
            },
            // Add other static or dynamic entries here
          ];
        });
      } else {
        print("No data found");
      }
    } catch (error) {
      print("Error occurred: $error");
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
          return const Center(
              child: CircularProgressIndicator()); // Show loading indicator
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || dataContainers.isEmpty) {
          return const Center(
            child: Text(
              'No data available',
            ),
          );
        }

        // Build the UI once data is available
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
              //* 1st TextButton Heading
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
              // *2nd Static heading
              const SecondHeading(),
              ExpandablePageView(
                onPageChanged: (horizontalScrollValue) {
                  toggleBackground(horizontalScrollValue);
                },
                controller: ctrl,
                children: List.generate(
                  (dataContainers.length / 10).ceil(),
                  (pageIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          for (int i = pageIndex * 10;
                              i < (pageIndex + 1) * 10 &&
                                  i < dataContainers.length;
                              i++)
                            VisibleContentAndToggleView(
                              name: dataContainers[i]['name'],
                              shortName: dataContainers[i]['shortName'],
                              conditionalValue: dataContainers[i]
                                  ['conditionalValue'],
                              totalValue: dataContainers[i]['totalValue'],
                              currencyShort: dataContainers[i]['currencyShort'],
                              isHiddenDataVisible: visibleCardIndex == i,
                              onVisibilityChanged: () => toggleVisibility(i),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
