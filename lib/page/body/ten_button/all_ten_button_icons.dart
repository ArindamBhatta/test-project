import 'package:flutter/material.dart';

class AllTenButtonIcons extends StatelessWidget {
  const AllTenButtonIcons({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(99, 255, 255, 255),
              width: 1.0,
            ),
          ),
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        SizedBox(
          width: 65.0,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 20),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.center,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
