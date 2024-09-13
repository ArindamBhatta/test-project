import 'package:flutter/material.dart';
import 'package:home_page/page/body/fear_and_green_indicator/heading_and_download_button.dart';
import 'package:home_page/page/body/fear_and_green_indicator/static_image_indicator.dart';
import 'data_percentage.dart';
import 'package:home_page/repo/repo.dart';

class FearAndGreedIndex extends StatefulWidget {
  const FearAndGreedIndex({super.key});

  @override
  State<FearAndGreedIndex> createState() {
    return _FearAndGreedIndexState();
  }
}

class _FearAndGreedIndexState extends State<FearAndGreedIndex> {
  late Future<Map<String, dynamic>?> _dataFuture;

  Color getColorFromCode(String colorCode) {
    switch (colorCode) {
      case 'red-400':
        return Colors.red.shade400;
      case 'green-400':
        return Colors.green.shade400;
      case 'blue-400':
        return Colors.blue.shade400;
      default:
        return Colors.black;
    }
  }

  Color getColorForLastMonth(String colorCode) {
    switch (colorCode) {
      case 'red-400':
        return const Color.fromARGB(255, 221, 106, 4);
      case 'green-400':
        return Colors.green.shade400;
      case 'blue-400':
        return Colors.blue.shade400;
      default:
        return Colors.black;
    }
  }

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
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //* heading and download button
                  const HeadingAndDownloadButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //* static needle indicator
                      const StaticImageIndicator(),
                      //* 2nd container
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //* 1st container
                              DataPercentage(
                                title: data['data']?['fg']?['h']?[0]?['t'] ??
                                    '404',
                                textData: (data['data']?['fg']?['h']?[0]?['c'])
                                    .toString(),
                                percentageData: (data['data']?['fg']?['h']?[0]
                                        ?['v'])
                                    .toString(),
                                defineColor: getColorFromCode(
                                    data['data']?['fg']?['h']?[0]?['cc'] ?? ''),
                              ),
                              const SizedBox(height: 8),
                              //* 2nd container
                              DataPercentage(
                                title: data['data']?['fg']?['h']?[1]?['t'] ??
                                    '404',
                                textData: (data['data']?['fg']?['h']?[1]?['c'])
                                    .toString(),
                                percentageData: (data['data']?['fg']?['h']?[1]
                                        ?['v'])
                                    .toString(),
                                defineColor: getColorFromCode(
                                    data['data']?['fg']?['h']?[1]?['cc'] ?? ''),
                              ),
                              const SizedBox(height: 8),
                              //* 3rd container
                              DataPercentage(
                                title: data['data']?['fg']?['h']?[2]?['t'] ??
                                    '404',
                                textData: (data['data']?['fg']?['h']?[2]?['c'])
                                    .toString(),
                                percentageData: (data['data']?['fg']?['h']?[2]
                                        ?['v'])
                                    .toString(),
                                defineColor: getColorForLastMonth(
                                    data['data']?['fg']?['h']?[2]?['cc'] ?? ''),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
