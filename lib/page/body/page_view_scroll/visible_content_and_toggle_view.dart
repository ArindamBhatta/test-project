import 'package:flutter/material.dart';
import 'hidden_content.dart';

class VisibleContentAndToggleView extends StatelessWidget {
  const VisibleContentAndToggleView({
    super.key,
    required this.isHiddenDataVisible,
    required this.onVisibilityChanged,
  });

  final bool isHiddenDataVisible;
  final VoidCallback onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      color: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Color.fromARGB(53, 0, 0, 0),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            AssetImage("assets/images/bit_coin.png"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bitcoin',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'BTC',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(
                                Icons.arrow_drop_up_sharp,
                                color: Colors.green,
                                size: 20.0,
                              ),
                              Text(
                                '0.3919',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '56857.00',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '1.00 BTC',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isHiddenDataVisible
                            ? Colors.blue[800]
                            : Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: isHiddenDataVisible ? 1.0 : 0.5,
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: onVisibilityChanged,
                        child: Center(
                          child: isHiddenDataVisible
                              ? const Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (isHiddenDataVisible) const HiddenContent(),
        ],
      ),
    );
  }
}
