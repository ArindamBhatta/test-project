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

  PageController ctrl = PageController();

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
                      duration: const Duration(milliseconds: 300),
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
                      duration: const Duration(milliseconds: 300),
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
                      duration: const Duration(milliseconds: 300),
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
                      duration: const Duration(milliseconds: 300),
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
                      duration: const Duration(milliseconds: 300),
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    for (int i = 1; i <= 10; i++)
                      VisibleContentAndToggleView(
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
  }
}
