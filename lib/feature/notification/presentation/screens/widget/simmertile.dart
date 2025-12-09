import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmerTile extends StatelessWidget {
  const NotificationShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Container(
          height: 14,
          width: 100,
          color: Colors.grey,
        ),
        subtitle: Container(
          height: 14,
          width: 150,
          color: Colors.grey,
          margin: const EdgeInsets.only(top: 6),
        ),
      ),
    );
  }
}
