import 'package:flutter/material.dart';

class SecondHeading extends StatelessWidget {
  const SecondHeading({super.key});
  @override
  Widget build(context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
