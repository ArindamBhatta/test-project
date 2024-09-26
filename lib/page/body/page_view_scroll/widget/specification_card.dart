import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'specification_card_extended.dart';
import '../Provider/specification_provider.dart';

class SpecificationCard extends StatelessWidget {
  SpecificationCard({
    super.key,
    required this.index,
    required this.cardNumber,
    required this.name,
    required this.shortName,
    required this.conditionalValue,
    required this.totalValue,
    required this.currencyShort,
  });

  final index;
  final String cardNumber;
  final String name;
  final String shortName;
  final conditionalValue;
  final String totalValue;
  final currencyShort;

  @override
  Widget build(BuildContext context) {
    final int? unfoldedCardIndex = context.select(
      (SpecificationProvider provider) => provider.unfoldedCardIndex,
    );
    bool unfold = index == unfoldedCardIndex;

    String currencyChange() {
      if (currencyShort > 1000000000) {
        return '${(currencyShort / 1000000000).toStringAsFixed(2)}T';
      } else if (currencyShort > 1000000) {
        return '${(currencyShort / 1000).toStringAsFixed(2)}M';
      } else if (currencyShort > 1000) {
        return '${(currencyShort / 1000).toStringAsFixed(2)}K';
      } else {
        return currencyShort.toString();
      }
    }

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
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        color: Colors.black,
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
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
                                  currencyChange(),
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
                                color: unfold ? Colors.blue[800] : Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: unfold ? 1.0 : 0.5,
                                ),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                ),
                                onPressed: () {
                                  context
                                      .read<
                                          SpecificationProvider>() //* use provider
                                      .cardState(index);
                                },
                                child: Center(
                                  child: unfold
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
                ),
              ],
            ),
          ),
          if (unfold)
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Color.fromARGB(150, 158, 158, 158),
                thickness: 1.0,
              ),
            ),
          if (unfold) const SpecificationCardExtended(),
        ],
      ),
    );
  }
}
