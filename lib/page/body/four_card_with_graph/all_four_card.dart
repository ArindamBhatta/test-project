import 'package:flutter/material.dart';
import 'package:home_page/repo/repo.dart';
import 'individual_card.dart';

class MCapCard extends StatefulWidget {
  const MCapCard({super.key});

  @override
  State<MCapCard> createState() {
    return _MCapCardState();
  }
}

class _MCapCardState extends State<MCapCard> {
  late Future<Map<String, dynamic>?> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = Repo.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data!;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // *1st card
              IndividualCard(
                title: 'Total M.cap',
                value: data['data']?['mc']?['v']?.toString() ?? '404',
                change: data['data']?['mc']?['c']?.toString() ?? '404',
              ),
              // *2nd card
              IndividualCard(
                title: '24h Vol',
                value: data['data']?['v']?['v']?.toString() ?? '404',
                change: data['data']?['v']?['c']?.toString() ?? '404',
              ),
              // *3rd card
              IndividualCard(
                title: 'BTC.D',
                value: data['data']?['b']?['v']?.toString() ?? '404',
                change: data['data']?['b']?['c']?.toString() ?? '404',
              ),
              // *4th card
              IndividualCard(
                title: 'ETH.D',
                value: data['data']?['e']?['v']?.toString() ?? '404',
                change: data['data']?['e']?['c']?.toString() ?? '404',
              ),
            ],
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
