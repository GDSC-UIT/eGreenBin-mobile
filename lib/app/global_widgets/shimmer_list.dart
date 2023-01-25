import 'package:egreenbin/app/global_widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  final int numOfLoad;

  const ShimmerList({super.key, this.numOfLoad = 5});

  Widget cardShimmer() {
    return ListTile(
      leading: const ShimmerWidget.circular(width: 50, height: 50),
      title: const ShimmerWidget.rectangular(height: 16),
      subtitle: Row(
        children: const [
          ShimmerWidget.rectangular(
            width: 30,
            height: 14,
          ),
          SizedBox(width: 10),
          ShimmerWidget.rectangular(
            width: 30,
            height: 14,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: numOfLoad,
      itemBuilder: (context, index) {
        return cardShimmer();
      },
    );
  }
}
