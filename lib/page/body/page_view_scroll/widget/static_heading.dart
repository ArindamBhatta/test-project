import 'package:flutter/material.dart';

class StaticHeading extends StatelessWidget {
  const StaticHeading({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '#▲  Name',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
        ),
        Text(
          'Last 7 Days',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
        ),
        Text(
          'Price',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
