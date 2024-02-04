import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  // Whether this tile is the first or last in the timeline
  final bool isFirst;
  final bool isLast;
  // Widget to be displayed at the end of the timeline
  final Widget endChild;

  // Constructor to initialize the timeline tile
  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.endChild,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      // Set whether this tile is the first or last in the timeline
      isFirst: isFirst,
      isLast: isLast,
      // Styling for the line before the timeline tile
      beforeLineStyle: const LineStyle(
        color: Colors.deepPurple,
      ),
      // Widget to be displayed at the end of the timeline
      endChild: endChild,
      // Styling for the timeline indicator
      indicatorStyle: IndicatorStyle(
        // Width of the timeline indicator
        width: 40,
        // Styling for the checkmark icon inside the indicator
        iconStyle: IconStyle(
          iconData: Icons.done_rounded,
          color: Colors.white,
        ),
        // Background color of the timeline indicator
        color: const Color.fromARGB(255, 190, 47, 215),
      ),
    );
  }
}
