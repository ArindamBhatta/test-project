import 'package:flutter/material.dart';
import './navbar.dart';
import './showing_all_container.dart';

class SectorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 3, 91, 158),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 32.0, left: 16.0),
            height: 70.0,
            child: const Navbar(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8.0,
              ),
              margin: EdgeInsetsDirectional.zero,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: const ShowingAllContainer(),
            ),
          ),
        ],
      ),
    );
  }
}
