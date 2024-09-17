import 'package:flutter/material.dart';
import './navbar.dart';
import './showing_all_container.dart';

class SectorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 7, 145, 237),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 7, 145, 237),
            padding: const EdgeInsets.only(top: 25.0, bottom: 8.0),
            child: const Navbar(),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
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
