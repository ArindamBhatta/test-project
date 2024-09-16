import 'package:flutter/material.dart';
import 'hidden_content.dart';

class VisibleContentAndToggleView extends StatelessWidget {
  const VisibleContentAndToggleView({
    super.key,
    required this.cardNumber,
    required this.name,
    required this.shortName,
    required this.conditionalValue,
    required this.totalValue,
    required this.currencyShort,
    required this.isHiddenDataVisible,
    required this.onVisibilityChanged,
  });
  final String cardNumber;
  final String name;
  final String shortName;
  final conditionalValue;
  final String totalValue;
  final currencyShort;
  final bool isHiddenDataVisible;
  final VoidCallback onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      color: Colors.white,
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Color.fromARGB(53, 70, 70, 70),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      cardNumber,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Icon(Icons.star_border_outlined),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        shortName,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_up_sharp,
                                        color: Colors.green,
                                        size: 20.0,
                                      ),
                                      Text(
                                        '$conditionalValue',
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
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  totalValue,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '$currencyShort',
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (isHiddenDataVisible)
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Color.fromARGB(150, 158, 158, 158),
                thickness: 1.0,
              ),
            ),
          if (isHiddenDataVisible) const HiddenContent(),
        ],
      ),
    );
  }
}
