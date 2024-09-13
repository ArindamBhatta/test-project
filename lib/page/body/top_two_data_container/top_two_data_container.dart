import 'package:flutter/material.dart';

class TopTwoDataContainer extends StatelessWidget {
  const TopTwoDataContainer({super.key});
  final value = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
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
                      backgroundImage: AssetImage("assets/images/bit_coin.png"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MicroStrategy Inc',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'P&L:',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '46.8M',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.green,
                              size: 16,
                            ),
                            Text(
                              '37.20%',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
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
                      backgroundImage: AssetImage("assets/images/bit_coin.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'EL Salvador',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'P&L:',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '46.8M',
                              style: TextStyle(
                                color: value < 0 ? Colors.red : Colors.green,
                                fontSize: 10,
                              ),
                            ),
                            Icon(
                              value < 0
                                  ? Icons.arrow_drop_down_sharp
                                  : Icons.arrow_drop_up_sharp,
                              color: value < 0 ? Colors.red : Colors.green,
                              size: 16,
                            ),
                            Text(
                              '37.20%',
                              style: TextStyle(
                                color: value < 0 ? Colors.red : Colors.green,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
