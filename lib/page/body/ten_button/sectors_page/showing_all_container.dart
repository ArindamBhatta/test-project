import 'package:flutter/material.dart';

import 'single_data_container.dart';
import '../../../../repo/repo.dart';

class ShowingAllContainer extends StatefulWidget {
  const ShowingAllContainer({super.key});

  @override
  State<ShowingAllContainer> createState() {
    return _ShowingAllContainerState();
  }
}

class _ShowingAllContainerState extends State<ShowingAllContainer> {
  int? visibleDataIndex;
  late Future<Map<String, dynamic>?> _dataFuture;

  void handleVisibilityChanged(int index) {
    setState(() {
      visibleDataIndex = (visibleDataIndex == index) ? null : index;
    });
  }

  @override
  void initState() {
    super.initState();
    _dataFuture = Repo.accessSectorsApi();
    print(_dataFuture);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            height: 100.0,
            color: Colors.white,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              color: Colors.black,
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading data'),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          print(data);
          return ListView.builder(
            // Added return here
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              return SingleDataContainer(
                icon: Icons.error,
                containerName: 'Arindam',
                avgChange: '400',
                avgChangePositive: false,
                marketCap: '400',
                volume: '400',
                topGainer: '400',
                gainerPercentage: '400',
                loserPercentage: '400',
                dominance: '400',
                isDataVisible: visibleDataIndex == index,
                onVisibilityChanged: () => handleVisibilityChanged(index),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
