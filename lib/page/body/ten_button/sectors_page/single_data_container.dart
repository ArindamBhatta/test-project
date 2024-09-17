import 'package:flutter/material.dart';
import 'hidden_data_container.dart';

class SingleDataContainer extends StatefulWidget {
  const SingleDataContainer({
    super.key,
    required this.icon,
    required this.containerName,
    required this.avgChange,
    required this.avgChangePositive,
    required this.marketCap,
    required this.volume,
    required this.gainers,
    required this.topGainer,
    required this.gainerPercentage,
    required this.looser,
    required this.loserPercentage,
    required this.dominance,
    required this.isDataVisible,
    required this.onVisibilityChanged,
  });

  final IconData icon;
  final String containerName;
  final String avgChange;
  final bool avgChangePositive;
  final String marketCap;
  final String volume;
  final String gainers;
  final String topGainer;
  final String gainerPercentage;
  final String looser;
  final String loserPercentage;
  final String dominance;
  final bool isDataVisible;
  final VoidCallback onVisibilityChanged;

  @override
  State<SingleDataContainer> createState() {
    return _SingleDataContainerState();
  }
}

class _SingleDataContainerState extends State<SingleDataContainer> {
  void switchDataVisibility() {
    widget.onVisibilityChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 6.0,
              bottom: 6.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(widget.icon, size: 34.0),
                    const SizedBox(width: 8.0),
                    Text(
                      widget.containerName,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              (widget.avgChangePositive)
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: widget.avgChangePositive
                                  ? Colors.green
                                  : Colors.red,
                              size: 16.0,
                            ),
                            const SizedBox(width: 2.0),
                            Text(
                              '${widget.avgChange}%',
                              style: TextStyle(
                                color: widget.avgChangePositive
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Avg. % Chg',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.isDataVisible
                            ? Colors.blue[800]
                            : Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: widget.isDataVisible ? 1.0 : 0.5,
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: widget.onVisibilityChanged,
                        child: Center(
                          child: widget.isDataVisible
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
          const SizedBox(height: 4.0),
          if (widget.isDataVisible)
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Color.fromARGB(150, 158, 158, 158),
                thickness: 2.0,
              ),
            ),
          if (widget.isDataVisible)
            HiddenDataContainer(
              marketCap: widget.marketCap,
              volume: widget.volume,
              gainers: widget.gainers,
              topGainer: widget.topGainer,
              gainerPercentage: widget.gainerPercentage,
              looser: widget.looser,
              loserPercentage: widget.loserPercentage,
              dominance: widget.dominance,
              isDataVisible: widget.isDataVisible,
              onVisibilityChanged: widget.onVisibilityChanged,
            ),
        ],
      ),
    );
  }
}
