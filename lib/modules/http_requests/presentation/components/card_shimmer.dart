import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromRGBO(40, 44, 52, 1),
      highlightColor: Color.fromRGBO(51, 56, 63, 1.0),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Container(
              width: 120,
              height: 16,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Container(
              width: 180,
              height: 14,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Container(
              width: 160,
              height: 14,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 32,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Container(
                  width: 130,
                  height: 32,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
