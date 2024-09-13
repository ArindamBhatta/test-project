import 'package:flutter/material.dart';
import '../body/body_container.dart';

class NavbarContainer extends StatelessWidget {
  const NavbarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue[800],
        iconSize: 25.0,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.donut_small_rounded,
              color: Color.fromARGB(255, 191, 188, 188),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.castle_rounded,
              color: Color.fromARGB(255, 191, 188, 188),
            ),
            label: '',
            backgroundColor: Color.fromARGB(100, 237, 233, 233),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_sharp,
              color: Color.fromARGB(255, 191, 188, 188),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: Color.fromARGB(255, 191, 188, 188),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.window,
              color: Color.fromARGB(255, 191, 188, 188),
            ),
            label: '',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 16.0,
                        backgroundImage:
                            AssetImage("assets/images/avatar_logo.png"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'ALTSOME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.donut_small_rounded,
                      ),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      ),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
                  child: const Text(
                    'Market',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Text(
                  'NFTs',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'News',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Jobs',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const BodyContainer(),
        ],
      ),
    );
  }
}
