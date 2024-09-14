import 'package:flutter/material.dart';
import 'second_heading.dart';
import 'text_button_heading.dart';
import 'visible_content_and_toggle_view.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class HeadingContainer extends StatefulWidget {
  const HeadingContainer({super.key});

  @override
  State<HeadingContainer> createState() {
    return _HeadingContainerState();
  }
}

class _HeadingContainerState extends State<HeadingContainer> {
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

  Color? getForegroundColor(int index) {
    return visibleBackground == index ? Colors.black : Colors.black;
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButtonHeading(
                  containerText: 'Top 10',
                  buttonBackgroundState: visibleBackground == 0,
                  foregroundColor: getForegroundColor(0)!,
                  onButtonPressed: () {
                    ctrl.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.ease,
                    );
                  },
                ),
                TextButtonHeading(
                  containerText: 'Gainers',
                  buttonBackgroundState: visibleBackground == 1,
                  foregroundColor: getForegroundColor(1)!,
                  onButtonPressed: () {
                    //toggleBackground(1);
                    ctrl.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.ease,
                    );
                  },
                ),
                TextButtonHeading(
                  containerText: 'Losers',
                  buttonBackgroundState: visibleBackground == 2,
                  foregroundColor: getForegroundColor(2)!,
                  onButtonPressed: () {
                    ctrl.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.ease,
                    );
                  },
                ),
                TextButtonHeading(
                  containerText: 'Trending',
                  buttonBackgroundState: visibleBackground == 3,
                  foregroundColor: getForegroundColor(3)!,
                  onButtonPressed: () {
                    ctrl.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.ease,
                    );
                  },
                ),
                TextButtonHeading(
                  containerText: 'News',
                  buttonBackgroundState: visibleBackground == 4,
                  foregroundColor: getForegroundColor(4)!,
                  onButtonPressed: () {
                    //toggleBackground(4);
                    ctrl.animateToPage(
                      4,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.ease,
                    );
                  },
                ),
              ],
            ),
          ),
          const SecondHeading(),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12.0,
            ),
            child: ExpandablePageView(
              onPageChanged: (horizontalScrollValue) async {
                getForegroundColor(horizontalScrollValue);
                await Future.delayed(const Duration(milliseconds: 900));
                toggleBackground(horizontalScrollValue);
              },
              controller: ctrl,
              children: [
                Column(
                  children: [
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 0,
                      onVisibilityChanged: () => toggleVisibility(0),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 1,
                      onVisibilityChanged: () => toggleVisibility(1),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 2,
                      onVisibilityChanged: () => toggleVisibility(2),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 3,
                      onVisibilityChanged: () => toggleVisibility(3),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 4,
                      onVisibilityChanged: () => toggleVisibility(4),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 5,
                      onVisibilityChanged: () => toggleVisibility(5),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 7,
                      onVisibilityChanged: () => toggleVisibility(7),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 8,
                      onVisibilityChanged: () => toggleVisibility(8),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 9,
                      onVisibilityChanged: () => toggleVisibility(9),
                    ),
                  ],
                ),
                Column(
                  children: [
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 10,
                      onVisibilityChanged: () => toggleVisibility(10),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 11,
                      onVisibilityChanged: () => toggleVisibility(11),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 12,
                      onVisibilityChanged: () => toggleVisibility(12),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 13,
                      onVisibilityChanged: () => toggleVisibility(13),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 14,
                      onVisibilityChanged: () => toggleVisibility(14),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 15,
                      onVisibilityChanged: () => toggleVisibility(15),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 16,
                      onVisibilityChanged: () => toggleVisibility(16),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 17,
                      onVisibilityChanged: () => toggleVisibility(17),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 18,
                      onVisibilityChanged: () => toggleVisibility(18),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 19,
                      onVisibilityChanged: () => toggleVisibility(19),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 20,
                      onVisibilityChanged: () => toggleVisibility(20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 21,
                      onVisibilityChanged: () => toggleVisibility(21),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 22,
                      onVisibilityChanged: () => toggleVisibility(22),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 23,
                      onVisibilityChanged: () => toggleVisibility(23),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 24,
                      onVisibilityChanged: () => toggleVisibility(24),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 25,
                      onVisibilityChanged: () => toggleVisibility(25),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 26,
                      onVisibilityChanged: () => toggleVisibility(26),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 27,
                      onVisibilityChanged: () => toggleVisibility(27),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 28,
                      onVisibilityChanged: () => toggleVisibility(28),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 29,
                      onVisibilityChanged: () => toggleVisibility(29),
                    ),
                    VisibleContentAndToggleView(
                      isHiddenDataVisible: visibleCardIndex == 30,
                      onVisibilityChanged: () => toggleVisibility(30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
