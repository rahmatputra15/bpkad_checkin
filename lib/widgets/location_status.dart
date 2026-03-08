import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LocationStatus extends StatelessWidget {
  final bool dalamRadius;
  final double meter;
  final bool loading;

  const LocationStatus({
    super.key,
    required this.dalamRadius,
    required this.meter,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Skeletonizer(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 5,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 22, backgroundColor: Colors.grey.shade300),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 250,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 5,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: dalamRadius ? Colors.green : Colors.red,
              child: Icon(
                dalamRadius
                    ? Icons.pin_drop_outlined
                    : Icons.location_off_outlined,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dalamRadius
                        ? "Anda sedang dilokasi kantor"
                        : "Anda berada di luar area kantor",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    dalamRadius
                        ? "Radius anda dengan kantor dalam jangkauan, anda secara otomatis tercatat berada di kantor"
                        : "Jarak anda ${meter.toStringAsFixed(0)} meter dari kantor. Anda belum dapat melakukan check in.",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
