import 'dart:async';
import 'package:home_page/model/model_two.dart';

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
  late Future<ModelTwo?> _dataFuture;
  PageController ctrl = PageController();

  @override
  void initState() {
    super.initState();
    _dataFuture = accessSecondApi();
  }

  Future<ModelTwo?> accessSecondApi() async {
    try {
      ModelTwo? resolvedData = await Repo.accessSecondApi();
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

  Widget buildContentView({
    required List<dynamic> items,
    required Map<String, dynamic>? details,
  }) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++)
          VisibleContentAndToggleView(
            cardNumber: items[i].toString(),
            name: details?[items[i].toString()]?.n ?? 'Unknown',
            shortName: details?[items[i].toString()]?.s ?? 'Unknown',
            totalValue: details?[items[i].toString()]?.l ?? 'Unknown',
            currencyShort: details?[items[i].toString()]?.ts ?? 0,
            conditionalValue: details?[items[i].toString()]?.p1 ?? 0,
            isHiddenDataVisible: visibleCardIndex == i,
            onVisibilityChanged: () => toggleVisibility(i),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<ModelTwo?>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          final details = data.data?.details;

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
                      for (int i = 0; i < 5; i++)
                        TextButtonHeading(
                          containerText: [
                            'Top 10',
                            'Gainers',
                            'Losers',
                            'Trending',
                            'News'
                          ][i],
                          buttonBackgroundState: visibleBackground == i,
                          onButtonPressed: () {
                            ctrl.animateToPage(
                              i,
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
                      child: buildContentView(
                        items: data.data?.tt,
                        details: details,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: buildContentView(
                        items: data.data!.tt, // Gainers items
                        details: details,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: buildContentView(
                        items: data.data!.tr,
                        details: details,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: buildContentView(
                        items: data.data!.tl,
                        details: details,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: buildContentView(
                        items: data.data!.rt,
                        details: details,
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
