import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../model/model_three.dart';
import '../widgets/visible_component.dart';
import '../provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);

    return FutureBuilder<ModelThree?>(
      future: toggleProvider.dataFuture,
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
          return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(4.0),
            itemCount: data.data!.length,
            itemBuilder: (context, index) {
              return VisibleComponent(
                containerName: data.data![index].n ?? 'N/A',
                avgChange: (data.data![index].apc).toString(),
                avgChangePositive: data.data![index].apc! > 0 ? true : false,
                marketCap: data.data![index].mc.toString(),
                volume: data.data![index].v.toString(),
                gainers: data.data![index].g.toString(),
                topGainer: data.data![index].tg.toString(),
                gainerPercentage: data.data![index].gp.toString(),
                looser: data.data![index].l.toString(),
                loserPercentage: data.data![index].lp.toString(),
                dominance: data.data![index].d.toString(),
                isDataVisible: toggleProvider.visibleDataIndex == index,
                onVisibilityChanged: () =>
                    toggleProvider.handleVisibilityChanged(index),
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
