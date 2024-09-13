import 'package:flutter/material.dart';
import 'second_heading.dart';
import 'all_text_heading_list.dart';
import 'card_box_container.dart';
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
                AllTextHeadingList(
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
                AllTextHeadingList(
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
                AllTextHeadingList(
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
                AllTextHeadingList(
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
                AllTextHeadingList(
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
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 0,
                      onVisibilityChanged: () => toggleVisibility(0),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 1,
                      onVisibilityChanged: () => toggleVisibility(1),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 2,
                      onVisibilityChanged: () => toggleVisibility(2),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 3,
                      onVisibilityChanged: () => toggleVisibility(3),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 4,
                      onVisibilityChanged: () => toggleVisibility(4),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 5,
                      onVisibilityChanged: () => toggleVisibility(5),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 7,
                      onVisibilityChanged: () => toggleVisibility(7),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 8,
                      onVisibilityChanged: () => toggleVisibility(8),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 9,
                      onVisibilityChanged: () => toggleVisibility(9),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 10,
                      onVisibilityChanged: () => toggleVisibility(10),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 11,
                      onVisibilityChanged: () => toggleVisibility(11),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 12,
                      onVisibilityChanged: () => toggleVisibility(12),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 13,
                      onVisibilityChanged: () => toggleVisibility(13),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 14,
                      onVisibilityChanged: () => toggleVisibility(14),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 15,
                      onVisibilityChanged: () => toggleVisibility(15),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 16,
                      onVisibilityChanged: () => toggleVisibility(16),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 17,
                      onVisibilityChanged: () => toggleVisibility(17),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 18,
                      onVisibilityChanged: () => toggleVisibility(18),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 19,
                      onVisibilityChanged: () => toggleVisibility(19),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 20,
                      onVisibilityChanged: () => toggleVisibility(20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 21,
                      onVisibilityChanged: () => toggleVisibility(21),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 22,
                      onVisibilityChanged: () => toggleVisibility(22),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 23,
                      onVisibilityChanged: () => toggleVisibility(23),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 24,
                      onVisibilityChanged: () => toggleVisibility(24),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 25,
                      onVisibilityChanged: () => toggleVisibility(25),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 26,
                      onVisibilityChanged: () => toggleVisibility(26),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 27,
                      onVisibilityChanged: () => toggleVisibility(27),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 28,
                      onVisibilityChanged: () => toggleVisibility(28),
                    ),
                    CardBoxContainer(
                      isHiddenDataVisible: visibleCardIndex == 29,
                      onVisibilityChanged: () => toggleVisibility(29),
                    ),
                    CardBoxContainer(
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
